import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fleet/pkg/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'logger.freezed.dart';

@freezed
class LoggerState with _$LoggerState {
  const factory LoggerState({
    @Default([]) List<Log> logs,
  }) = _LoggerState;
}

enum LogType { api, event, exception }

class Log {
  Log({
    required this.type,
    this.path,
    this.response,
    this.statusCode,
    this.bloc,
    this.event,
    this.exceptionType,
    this.exceptionSource,
    this.stackTrace,
  });

  final LogType type;

  final String? path;
  final String? response;
  final String? statusCode;

  final String? bloc;
  final String? event;

  final String? exceptionType;
  final String? exceptionSource;
  final String? stackTrace;
}

class Logger extends Cubit<LoggerState> {
  Logger(this._clipBoard) : super(const LoggerState());

  final IClipBoard _clipBoard;

  void logAPI(
    String path,
    String response,
    int statusCode,
  ) async {
    try {
      final log = Log(
        type: LogType.api,
        path: path,
        response: response,
        statusCode: statusCode.toString(),
      );

      _addToLog(log);
    } catch (e) {
      print(e.toString());
    }
  }

  void addEvent(String event) async {
    try {
      final strs = event.split('.');
      final log = Log(
        type: LogType.event,
        bloc: strs[0],
        event: strs[1],
      );

      await Future.delayed(const Duration(milliseconds: 5));

      _addToLog(log);
    } catch (e) {
      print(e.toString());
    }
  }

  void addExpectionToLog(
    dynamic e,
    String source,
    dynamic s,
  ) async {
    try {
      final log = Log(
        type: LogType.exception,
        exceptionSource: source,
        exceptionType: e.toString(),
        stackTrace: (s as StackTrace).toString(),
      );

      print(
        '\n\nERROR @ ' +
            log.exceptionSource! +
            '\nMessage: ' +
            log.exceptionType! +
            '\nTrace: ' +
            log.stackTrace! +
            '\n\n',
      );

      _addToLog(log);

      //await Sentry.captureException(
      //  event.e,
      //  stackTrace: event.s,
      //  hint: event.source,
      //);

      await Sentry.captureException(e, stackTrace: s);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } catch (e) {
      print(e.toString());
    }
  }

  void copyToClipboard(String text) {
    _clipBoard.copyToClipBoard(text);
    // showToast('COPIED');
  }

  void _addToLog(Log log) {
    final List<Log> logs = state.logs.toList();
    logs.add(log);
    emit(state.copyWith(logs: logs));
  }
}
