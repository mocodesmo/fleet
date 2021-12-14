import 'package:dio/dio.dart';
import 'package:fleet/api/_helpers.dart';
import 'package:retry/retry.dart';

abstract class IUserAPI {
  Future<Response> getUserLogin({
    required String authToken,
    required String phoneNumber,
  });

  Future<Response> postUserAdmin({
    required String authToken,
    required String code,
  });

  Future<Response> getUserList({
    required String authToken,
  });

  Future<Response> postIssue({
    required String issue,
  });
}

class UserAPI implements IUserAPI {
  @override
  Future<Response> getUserLogin({
    required String authToken,
    required String phoneNumber,
  }) async {
    final path = serverUrl + '/user/login';

    final response = await retry(
      () => client
          .get(
            path,
            options: Options(
              headers: {
                'Auth': authToken,
                'Phone': phoneNumber,
              },
              validateStatus: (status) => true,
            ),
          )
          .timeout(timeout),
      retryIf: (e) => e is TimeoutException,
      maxAttempts: 5,
    );

    return parseResponse(response);
  }

  @override
  Future<Response> postUserAdmin({
    required String authToken,
    required String code,
  }) async {
    final path = serverUrl + '/user/admin';

    final response = await retry(
      () => client
          .post(
            path,
            options: Options(
              headers: {
                'Auth': authToken,
                'Code': code,
              },
              validateStatus: (status) => true,
            ),
          )
          .timeout(timeout),
      retryIf: (e) => e is TimeoutException,
      maxAttempts: 5,
    );

    return parseResponse(response);
  }

  @override
  Future<Response> getUserList({required String authToken}) async {
    final path = serverUrl + '/user/users';

    final response = await retry(
      () => client
          .get(
            path,
            options: Options(
              headers: {
                'Auth': authToken,
              },
              validateStatus: (status) => true,
            ),
          )
          .timeout(timeout),
      retryIf: (e) => e is TimeoutException,
      maxAttempts: 5,
    );

    return parseResponse(response);
  }

  @override
  Future<Response> postIssue({required String issue}) async {
    const path = 'http://34.93.199.198' '/issue';

    final response = await retry(
      () => client
          .post(
            path,
            options: Options(
              headers: {
                'Issue': issue,
              },
              validateStatus: (status) => true,
            ),
          )
          .timeout(timeout),
      retryIf: (e) => e is TimeoutException,
      maxAttempts: 5,
    );

    return parseResponse(response);
  }
}
