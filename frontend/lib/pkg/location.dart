import 'dart:async';

import 'package:flutter/services.dart';
import 'package:location/location.dart';

abstract class ILocation {
  Future<bool> checkPermission();
  Future<bool> requestPermission();

  Future<bool> checkService();
  Future<bool> requestService();

  Future<bool> checkBG();
  Future<bool> enableBG();
  Future<bool> disableBG();

  void listenLocation(
    Function(LocationData) onUpdate,
    Function(String) onError,
  );
  void stopListening();
}

class Loocation implements ILocation {
  final Location _location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

  @override
  Future<bool> checkPermission() async {
    final PermissionStatus permissionGrantedResult =
        await _location.hasPermission();

    return permissionGrantedResult == PermissionStatus.granted;
  }

  @override
  Future<bool> requestPermission() async {
    final PermissionStatus permissionRequestedResult =
        await _location.requestPermission();

    return permissionRequestedResult == PermissionStatus.granted;
  }

  @override
  Future<bool> checkService() async {
    final bool serviceEnabledResult = await _location.serviceEnabled();
    return serviceEnabledResult;
  }

  @override
  Future<bool> requestService() async {
    final bool serviceRequestedResult = await _location.requestService();
    return serviceRequestedResult;
  }

  @override
  Future<bool> checkBG() async {
    final bool result = await _location.isBackgroundModeEnabled();
    return result;
  }

  @override
  Future<bool> enableBG() async {
    final bool result = await _location.enableBackgroundMode();
    return result;
  }

  @override
  Future<bool> disableBG() async {
    final bool result = await _location.enableBackgroundMode(enable: false);
    return result;
  }

  @override
  void listenLocation(
    Function(LocationData) onUpdate,
    Function(String) onError,
  ) {
    bool started = false;
    _location.changeSettings(
      accuracy: LocationAccuracy.navigation,
      interval: 10000,
    );
    _locationSubscription = _location.onLocationChanged.handleError(
      (dynamic err) {
        if (err is PlatformException) {
          onError(err.message ?? 'error');
        }
        _locationSubscription?.cancel();
        _locationSubscription = null;
      },
    ).listen(
      (LocationData currentLocation) async {
        onError('');
        if (!started) {
          await Future.delayed(const Duration(seconds: 10));
          started = true;
        }
        onUpdate(currentLocation);
      },
    );
  }

  @override
  void stopListening() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
  }
}
