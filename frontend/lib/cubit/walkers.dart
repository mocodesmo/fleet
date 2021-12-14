import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/api/user.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/cubit/user.dart';
import 'package:fleet/model/user.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/storage.dart';

part 'walkers.freezed.dart';

@freezed
class WalkersState with _$WalkersState {
  const factory WalkersState({
    @Default([]) List<User> walkers,
    @Default(false) bool loadingWalkers,
    @Default('') String errLoadingWalkers,
    // User? selectedWalker,
  }) = _WalkersState;
  const WalkersState._();

  Set<Polyline> routeLines() {
    if (walkers.isEmpty) return <Polyline>{};
    final Set<Polyline> lines = {};
    for (final walker in walkers)
      if (walker.currentWalk != null)
        lines.add(walker.currentWalk!.routeLine());
    return lines;
  }

  bool hasLiveWalkers() {
    for (final w in walkers) {
      if (w.isWalking) return true;
    }
    return false;
  }
}

class WalkersCubit extends Cubit<WalkersState> {
  WalkersCubit(
    this._userAPI,
    this._logger,
    this._storage,
    this._userCubit,
  ) : super(const WalkersState()) {
    getWalkers();
  }

  final IStorage _storage;
  final Logger _logger;
  final IUserAPI _userAPI;
  final UserCubit _userCubit;

  void getWalkers() async {
    try {
      if (!_userCubit.state.user!.isAdmin) return;
      emit(
        state.copyWith(
          loadingWalkers: true,
          errLoadingWalkers: '',
        ),
      );

      final token = await _storage.getOne(StoreKeys.token.name);
      final resp = await _userAPI.getUserList(authToken: token);
      if (resp.statusCode != 200) throw resp.data.toString();

      final data = jsonDecode(resp.data as String);

      final List<User> walkers = [];
      for (final walker in data['walkers'] as List) {
        final user = User.fromJson(walker as Map<String, dynamic>);
        if (!user.isAdmin) walkers.add(user);
      }

      emit(
        state.copyWith(
          walkers: walkers,
          loadingWalkers: false,
        ),
      );
    } catch (e, s) {
      _logger.addExpectionToLog(e, 'WalkersCubit.getWalkers', s);

      emit(
        state.copyWith(
          loadingWalkers: false,
          errLoadingWalkers: e.toString(),
        ),
      );
    }
  }

  void updateCurrentWalk(String userId, Walk walk) {
    try {
      final walkers = state.walkers.toList();
      var walker = walkers.firstWhere((u) => u.id.id == userId);
      walker = walker.copyWith(currentWalk: walk);
      walkers.removeWhere((u) => u.id.id == userId);
      walkers.add(walker);
      emit(state.copyWith(walkers: walkers));
    } catch (e, s) {
      _logger.addExpectionToLog(e, 'WalkersCubit.updateCurrentWalk', s);
    }
  }
}
