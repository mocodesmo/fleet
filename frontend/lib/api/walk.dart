import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fleet/api/_helpers.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class IWalkAPI {
  void connect({
    required String authToken,
    required Function(dynamic) connectEvent,
    required Function(dynamic) messageEvent,
    required Function disconnectEvent,
  });

  void disconnect();

  void startWalk();
  void endWalk();
  void updateLocation(String msg);
}

class WalkAPI implements IWalkAPI {
  IOWebSocketChannel? _channel;
  WebSocketChannel? _wchannel;

  @override
  void connect({
    required String authToken,
    required Function(dynamic) connectEvent,
    required Function(dynamic) messageEvent,
    required Function disconnectEvent,
  }) {
    if (_channel != null) return;

    final address = serverUrl.replaceAll('http://', '');

    if (!kIsWeb) {
      _channel = IOWebSocketChannel.connect(
        Uri.parse('ws://$address/walk'),
        // headers: {'Auth': authToken},
      );

      _channel!.sink.add(
        jsonEncode({
          'event': 'auth',
          'tok': authToken,
        }),
      );

      _channel!.stream.listen(
        (message) {
          print('msg::' + message.toString());
          final data = jsonDecode(message as String);
          if (data['event'] == 'connected')
            connectEvent(data);
          else if (data['event'] == 'disconnect')
            disconnect();
          else
            messageEvent(data);
        },
        onDone: () async {
          disconnect();
          await Future.delayed(const Duration(seconds: 3));
          print('done');
          connect(
            authToken: authToken,
            connectEvent: connectEvent,
            messageEvent: messageEvent,
            disconnectEvent: disconnectEvent,
          );
        },
        onError: (e) async {
          disconnect();
          await Future.delayed(const Duration(seconds: 3));
          print('err ws :: ' + e.toString());
          connect(
            authToken: authToken,
            connectEvent: connectEvent,
            messageEvent: messageEvent,
            disconnectEvent: disconnectEvent,
          );
        },
        // cancelOnError: false,
      );
    } else {
      _wchannel = WebSocketChannel.connect(
        Uri.parse('ws://$address/walk'),
        // headers: {'Auth': authToken},
      );

      _wchannel!.sink.add(
        jsonEncode({
          'event': 'auth',
          'tok': authToken,
        }),
      );

      _wchannel!.stream.listen(
        (message) {
          print('msg::' + message.toString());
          final data = jsonDecode(message as String);
          if (data['event'] == 'connected')
            connectEvent(data);
          else if (data['event'] == 'disconnect')
            disconnect();
          else
            messageEvent(data);
        },
        onDone: () async {
          disconnect();
          await Future.delayed(const Duration(seconds: 3));
          print('done');
          connect(
            authToken: authToken,
            connectEvent: connectEvent,
            messageEvent: messageEvent,
            disconnectEvent: disconnectEvent,
          );
        },
        onError: (e) async {
          disconnect();
          await Future.delayed(const Duration(seconds: 3));
          print('err ws :: ' + e.toString());
          connect(
            authToken: authToken,
            connectEvent: connectEvent,
            messageEvent: messageEvent,
            disconnectEvent: disconnectEvent,
          );
        },
        // cancelOnError: false,
      );
    }
  }

  @override
  void disconnect() {
    if (kIsWeb) {
      if (_wchannel == null) return;
      _wchannel!.sink.close();
      _wchannel = null;
    } else {
      if (_channel == null) return;
      _channel!.sink.close();
      // _channel!.stream.
      _channel = null;
    }
  }

  @override
  void endWalk() {
    if (kIsWeb) {
      if (_wchannel == null) return;
      _wchannel!.sink.add(
        jsonEncode({
          'event': 'end_walk',
          'time': DateTime.now().millisecondsSinceEpoch,
        }),
      );
    } else {
      if (_channel == null) return;
      _channel!.sink.add(
        jsonEncode({
          'event': 'end_walk',
          'time': DateTime.now().millisecondsSinceEpoch,
        }),
      );
    }
  }

  @override
  void startWalk() {
    if (kIsWeb) {
      if (_wchannel == null) return;
      _wchannel!.sink.add(
        jsonEncode({
          'event': 'start_walk',
          'time': DateTime.now().millisecondsSinceEpoch,
        }),
      );
    } else {
      if (_channel == null) return;
      _channel!.sink.add(
        jsonEncode({
          'event': 'start_walk',
          'time': DateTime.now().millisecondsSinceEpoch,
        }),
      );
    }
  }

  @override
  void updateLocation(String msg) {
    if (kIsWeb) {
      if (_wchannel == null) return;
      _wchannel!.sink.add(msg);
    } else {
      if (_channel == null) return;
      _channel!.sink.add(msg);
    }
  }
}
