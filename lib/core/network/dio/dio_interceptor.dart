import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CustomInterceptor implements Interceptor {
  final SharedPreferences sharedPreferences;
  final FlutterSecureStorage secureStorage;

  CustomInterceptor(this.sharedPreferences, this.secureStorage);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print("ERROR:"
          "Endpoint: ${err.requestOptions.path}\n"
          "Body:");
      log("${err.response}");
    }
    handler.reject(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await secureStorage.read(key: AppConstants.tokenKey);
    // log("Requesting: ${options.path} with token: $token with ");
    // // log the full path url
    // log("Full URL: ${options.baseUrl}${options.path}");
    // options.headers.addAll({
    //   'Authorization': 'Bearer $token',
    //   'lang': '${sharedPreferences.getString(AppConstants.langKey)}',
    // });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.resolve(response);
  }
}
