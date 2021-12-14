import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/pkg/storage.dart';

part 'become-admin.freezed.dart';

@freezed
class BecomeAdminState with _$BecomeAdminState {
  const factory BecomeAdminState({
    @Default('') String code,
    @Default(false) bool loadingBecomeAdmin,
    @Default('') String errBecomingAdmin,
    @Default(false) bool becameAdmin,
  }) = _BecomeAdminState;
}

class BecomeAdminCubit extends Cubit<BecomeAdminState> {
  BecomeAdminCubit(
    this._userAPI,
    this._storage,
    this._logger,
  ) : super(const BecomeAdminState());

  final IStorage _storage;
  final IUserAPI _userAPI;
  final Logger _logger;

  void codeChanged(String code) {
    emit(state.copyWith(code: code, errBecomingAdmin: ''));
  }

  void becomeClicked() async {
    try {
      emit(
        state.copyWith(
          loadingBecomeAdmin: true,
          errBecomingAdmin: '',
        ),
      );

      final token = await _storage.getOne(StoreKeys.token.name);
      final resp =
          await _userAPI.postUserAdmin(authToken: token, code: state.code);
      if (resp.statusCode != 200) throw resp.data.toString();
      emit(
        state.copyWith(
          loadingBecomeAdmin: false,
          becameAdmin: true,
        ),
      );
    } catch (e, s) {
      _logger.addExpectionToLog(e, 'UserCubit.getUser', s);

      emit(
        state.copyWith(
          loadingBecomeAdmin: false,
          errBecomingAdmin: e.toString(),
        ),
      );
    }
  }
}
