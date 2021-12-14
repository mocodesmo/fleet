import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/model/user.dart';
import 'package:fleet/pkg/firebase.dart';
import 'package:fleet/pkg/storage.dart';

part 'user.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool authenticated,
    User? user,
    @Default(false) bool gettingUser,
    @Default('') String errorOnGet,
  }) = _UserState;
}

class UserCubit extends Cubit<UserState> {
  UserCubit(
    this._storage,
    this._authGateway,
    this._userAPI,
    this._logger,
  ) : super(const UserState()) {
    getUser();
  }

  final IStorage _storage;
  final IAuthGateway _authGateway;
  final IUserAPI _userAPI;
  final Logger _logger;

  void getUser() async {
    try {
      emit(state.copyWith(gettingUser: true));
      await Future.delayed(const Duration(milliseconds: 500));
      final token = await _storage.getOne(StoreKeys.token.name);
      if (token == '') return;
      final phone = await _storage.getOne(StoreKeys.phone.name);
      if (phone == '') return;
      final refresh = await _authGateway.refreshUser();
      if (refresh != '')
        await _storage.saveOrUpdateOne(StoreKeys.token.name, refresh);

      // await Future.delayed(const Duration(milliseconds: 5000));
      final response = await _userAPI.getUserLogin(
        authToken: refresh.isEmpty ? token : refresh,
        phoneNumber: phone,
      );

      if (response.statusCode == null) throw '';

      if (response.statusCode == 403 ||
          response.statusCode == 400 ||
          response.statusCode == 401) {
        logOut();
        return;
      }

      if (response.statusCode == 500) {
        emit(
          const UserState(
            authenticated: false,
            errorOnGet: 'Error Occured. Please try again.',
          ),
        );
        return;
      }

      if (response.statusCode != 200) throw '';

      final data = jsonDecode(response.data as String) as Map<String, dynamic>;
      final user = User.fromJson(data);
      emit(UserState(authenticated: true, user: user));
    } catch (e, s) {
      if (e == 'empty' || e == 'no user') {
        logOut();
        return;
      }
      _logger.addExpectionToLog(e, 'UserCubit.getUser', s);

      emit(
        const UserState(
          authenticated: true,
          errorOnGet: 'Error Occured. Please try again.',
        ),
      );
    }
  }

  void updateUser(User user) {
    emit(state.copyWith(user: user));
  }

  void logOut() async {
    try {
      emit(const UserState());
      _authGateway.signOutt();
      _storage.deleteOne(StoreKeys.token.name);
      _storage.deleteOne(StoreKeys.phone.name);
    } catch (e, s) {
      _logger.addExpectionToLog(e, 'UserCubit.logOut', s);
    }
  }
}
