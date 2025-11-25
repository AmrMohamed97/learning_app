import 'package:dio/dio.dart';
import 'package:msal_auth/msal_auth.dart';

import 'failures.dart';

class ErrorHandler implements Exception {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      final failure = _handleDioError(error);
      // if (failure is AuthFailure) {
      //   final context = navigatorKey.currentContext;
      //   if (context != null) {
      //     ProviderScope.containerOf(context)
      //         .read(authProvider.notifier)
      //         .logout(ignoreLoading: true);
      //   }
      // }
      return failure;
    } else if (error is MsalException) {
      return DefaultFailure(code: error.hashCode, message: error.message);
    }
    return const DefaultFailure();
  }

  static Failure _handleDioError(DioException error) {
    final errorData = error.response?.data;
    switch (error.type) {
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.unauthorized:
            return errorData is Map?
                ? AuthFailure(
                    message:
                        errorData?['message'] ??
                        errorData?['error']?['message'],
                    code: errorData?['code'],
                  )
                : const AuthFailure();
          case ResponseCode.redirect:
            return errorData is Map?
                ? AuthFailure(
                    message:
                        errorData?['message'] ??
                        errorData?['error']?['message'],
                    code: errorData?['code'],
                  )
                : const AuthFailure();
          default:
            return errorData is Map?
                ? DefaultFailure(
                    message:
                        errorData?['message'] ??
                        (errorData?['error'] is Map?
                            ? errorData?['error']?['message']
                            : errorData?['error']),
                    code: errorData?['code'],
                  )
                : const DefaultFailure();
        }
      default:
        return const DefaultFailure();
    }
  }
}

class ResponseCode {
  // API status codes
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no content
  static const int badRequest = 400; // failure, api rejected the requests
  static const int forbidden = 403; // failure, api rejected the requests
  static const int redirect = 302; // failure user is not authorised
  static const int unauthorized = 401; // failure user is not authorised
  static const int notFound =
      404; // failure, api url is not correct and not found
  static const int internalServerError =
      500; // failure, crash happened in server side
}
