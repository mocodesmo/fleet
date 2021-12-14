import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fleet/cubit/state.dart';
export 'dart:async';

// const address = '10.0.2.2:5000';
// const serverUrl = 'http://$address';
String get serverUrl => serverCubit.state.url;

const timeout = Duration(seconds: 40);

final client = Dio(BaseOptions(receiveDataWhenStatusError: true));

//Response logResponse(Response res) {
//  try {
//    logger.addAPIToLog(LogAPI(
//        path: res.request.path,
//        response: jsonEncode(res.data),
//        statusCode: res.statusCode!));
//  } catch (e, s) {
//    logger.addExpectionToLog(e, 'api.logresponse', s);
//  }

//  return res;
//}

Response parseResponse(Response res) {
  try {
    logger.logAPI(
      res.requestOptions.path,
      jsonEncode(res.data),
      res.statusCode!,
    );

    // if (res.statusCode == 401) userCubit.logOut();
  } catch (e, s) {
    logger.addExpectionToLog(e, 'api.logresponse', s);
  }

  return res;
}

const timeOut = Duration(seconds: 40);
