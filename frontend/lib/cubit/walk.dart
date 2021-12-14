import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';
import 'package:fleet/api/walk.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/pkg/location.dart';
import 'package:fleet/pkg/storage.dart';

part 'walk.freezed.dart';

@freezed
class WalkState with _$WalkState {
  const factory WalkState({
    @Default(false) bool socketConnected,
    @Default(false) bool connectingSocket,
    @Default(false) bool startingWalk,
    @Default('') String errSocket,
    @Default(false) bool walkCompleted,
    @Default(false) bool isWalking,
    @Default('') String errWalking,
  }) = _WalkState;
}

class WalkCubit extends Cubit<WalkState> {
  WalkCubit(
    this._storage,
    this._logger,
    this._walkAPI,
    this._location,
  ) : super(const WalkState()) {
    setupSocket();
  }

  final IStorage _storage;
  final Logger _logger;
  final IWalkAPI _walkAPI;
  final ILocation _location;

  void setupSocket() async {
    try {
      emit(state.copyWith(connectingSocket: true, errSocket: ''));
      final authToken = await _storage.getOne(StoreKeys.token.name);
      _walkAPI.connect(
        authToken: authToken,
        connectEvent: onConnectEvent,
        messageEvent: (m) {},
        disconnectEvent: onDisconnectEvent,
      );
      emit(state.copyWith(connectingSocket: false, socketConnected: true));
    } catch (e, s) {
      emit(
        state.copyWith(
          connectingSocket: false,
          socketConnected: false,
          errSocket: e.toString(),
        ),
      );

      emit(state.copyWith(errSocket: e.toString()));
      _logger.addExpectionToLog(e, 'WalkCubit.setupSocket', s);
    }
  }

  void onConnectEvent(dynamic data) {
    emit(state.copyWith(socketConnected: true));
  }

  void onDisconnectEvent() {
    emit(state.copyWith(socketConnected: false));
  }

  void startWalk() async {
    try {
      emit(
        state.copyWith(
          isWalking: false,
          errWalking: '',
          startingWalk: true,
        ),
      );

      final check1 = await _location.checkPermission();

      if (!check1) {
        final check2 = await _location.requestPermission();
        if (!check2) throw 'permission not granted';
      }

      final check3 = await _location.checkService();
      if (!check3) {
        final check4 = await _location.requestService();
        if (!check4) throw 'service not started';
      }

      final check5 = await _location.checkBG();
      if (check5) {
        final check6 = await _location.enableBG();
        if (!check6) throw 'BG not enabled';
      }

      _walkAPI.startWalk();
      await Future.delayed(const Duration(seconds: 1));
      _location.listenLocation(
        (loc) {
          locationUpdated(loc);
        },
        (err) {
          emit(state.copyWith(errWalking: err));
          if (err != '') stopWalk();
        },
      );

      emit(
        state.copyWith(
          isWalking: true,
          errWalking: '',
          startingWalk: false,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(errWalking: e.toString()));
      _logger.addExpectionToLog(e, 'WalkCubit.startWalk', s);
    }
  }

  void locationUpdated(LocationData loc) {
    if (loc.latitude == null || loc.longitude == null) return;

    _walkAPI.updateLocation(
      jsonEncode({
        'event': 'update_location',
        'time': DateTime.now().millisecondsSinceEpoch,
        'lat': loc.latitude,
        'lng': loc.longitude,
      }),
    );
  }

  void stopWalk() async {
    try {
      _walkAPI.endWalk();
      await Future.delayed(const Duration(seconds: 1));
      _location.stopListening();
      emit(
        state.copyWith(
          isWalking: false,
          errWalking: '',
          walkCompleted: true,
        ),
      );
    } catch (e, s) {
      emit(state.copyWith(errWalking: e.toString()));
      _logger.addExpectionToLog(e, 'WalkCubit.stopWalk', s);
    }
  }
}
