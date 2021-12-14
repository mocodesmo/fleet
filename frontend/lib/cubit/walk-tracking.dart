import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fleet/api/walk.dart';
import 'package:fleet/cubit/logger.dart';
import 'package:fleet/cubit/walkers.dart';
import 'package:fleet/model/walk.dart';
import 'package:fleet/pkg/storage.dart';

part 'walk-tracking.freezed.dart';

@freezed
class WalkTrackingState with _$WalkTrackingState {
  const factory WalkTrackingState({
    @Default(false) bool socketConnected,
    @Default(false) bool connectingSocket,
    @Default('') String errSocket,
    @Default(false) bool walkCompleted,
    Walk? walk,
    GoogleMapController? mapController,
  }) = _WalkTrackingState;
}

class WalkTrackingCubit extends Cubit<WalkTrackingState> {
  WalkTrackingCubit(
    this.userID,
    this._storage,
    this._logger,
    this._walkAPI,
    this._walkersCubit,
  ) : super(const WalkTrackingState()) {
    setupSocket();
  }

  final IStorage _storage;
  final Logger _logger;
  final IWalkAPI _walkAPI;
  final String? userID;
  final WalkersCubit? _walkersCubit;

  void setupSocket() async {
    try {
      emit(
        state.copyWith(
          connectingSocket: true,
          errSocket: '',
        ),
      );
      final authToken = await _storage.getOne(StoreKeys.token.name);
      _walkAPI.connect(
        authToken: authToken,
        connectEvent: onConnectEvent,
        messageEvent: onMessageEvent,
        disconnectEvent: onDisconnectEvent,
      );
      emit(
        state.copyWith(
          connectingSocket: false,
          socketConnected: true,
          errSocket: '',
        ),
      );
    } catch (e, s) {
      emit(
        state.copyWith(
          connectingSocket: false,
          socketConnected: false,
          errSocket: e.toString(),
        ),
      );
      _logger.addExpectionToLog(e, 'WalkTrackingCubit.setupSocket', s);
    }
  }

  void onConnectEvent(dynamic data) {
    emit(state.copyWith(socketConnected: true));
  }

  void onDisconnectEvent() {
    emit(state.copyWith(socketConnected: false));
  }

  void onMessageEvent(dynamic data) async {
    try {
      print('onMessageEvent');

      if (userID != null) {
        if (data['uid'] != userID) return;

        if (data['event'] == 'end_walk')
          emit(state.copyWith(walkCompleted: true));

        if (data['event'] == 'update_location') {
          final walkJson = jsonDecode(data['walk'] as String);
          final walk = Walk.fromJson(walkJson as Map<String, dynamic>);
          emit(state.copyWith(walk: walk));
          await Future.delayed(const Duration(milliseconds: 500));
          if (state.mapController != null)
            state.mapController!.animateCamera(
              CameraUpdate.newLatLngZoom(walk.lastLocation(), 19),
            );
        }
      } else {
        if (data['event'] == 'update_location') {
          final walkJson = jsonDecode(data['walk'] as String);
          final walk = Walk.fromJson(walkJson as Map<String, dynamic>);
          emit(state.copyWith(walk: walk));
          if (_walkersCubit != null)
            _walkersCubit!.updateCurrentWalk(data['uid'] as String, walk);
        }
      }
    } catch (e, s) {
      _logger.addExpectionToLog(e, 'WalkTrackingCubit.onTypingEvent', s);
    }
  }

  void initMapController(GoogleMapController controller) {
    emit(state.copyWith(mapController: controller));
  }

  void disconnectSocket() {
    _walkAPI.disconnect();
    emit(state.copyWith(socketConnected: false));
  }
}
