/*
import 'package:dio/dio.dart';
import '../../core/const/app_const.dart';
import '../../core/utills/cache_helper.dart';
import '../../core/utills/extract.dart';

class DioManager {
  static DioManager? _instance;
  Dio? _dio;

  DioManager._internal() {
    _dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrlApi));
    addDioInterceptors();
  }

  factory DioManager() {
    _instance ??= DioManager._internal();
    return _instance!;
  }

  void setDio(Dio dio) => _dio = dio;

  Dio get dio => _dio!;

  //----------------------------------------------------------------------------

  // void addPrettyDioLogger() => _dio!.interceptors
  //     .add(PrettyDioLogger(requestHeader: true, requestBody: true));
  void addDioInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String token = await CacheHelper.getSecuerString(
            key: StorageKeys.accessToken,
          );
          options.headers["Authorization"] = "Bearer $token";

          options.headers["Accept-Language"] = getHeaderLang();
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.headers['set-cookie'] != null) {
            final cookies = response.headers['set-cookie'];

            String refreshToken = extractRefreshToken(cookies!.first);

            // You can save these cookies for future requests if needed
            CacheHelper.setSecuerString(
              key: StorageKeys.refreshToken,
              value: refreshToken,
            );
          }
          return handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            final newAccessToken = await refreshToken();
            if (newAccessToken != null) {
              // print(
              //     'refresh is done========================================================');
              _dio!.options.headers["Authorization"] = "Bearer $newAccessToken";
              // return handler.resolve(await _dio!.fetch(error.requestOptions));
              final requestOptions = error.requestOptions;

              // Check if the request contains FormData
              if (requestOptions.data is FormData) {
                // Fetch or recreate the FormData here
                FormData newFormData = await _createFormDataFromRequest(
                  requestOptions.data,
                );

                // Update the request options with the new FormData
                requestOptions.data = newFormData;
              }

              // Retry the request with the new options
              return handler.resolve(await _dio!.fetch(requestOptions));
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  Future<String?> refreshToken() async {
    try {
      String refreshToken = await CacheHelper.getSecuerString(
        key: StorageKeys.refreshToken,
      );
      final cookie = 'refreshToken=$refreshToken';
      _dio?.options.headers['Cookie'] = cookie;
      final response = await _dio!.get(
        'Authentication/RefreshToken',
      ); //url of refresh token and add old token
      final newAccessToken =
          response.data['token']; //name of refresh token in body
      CacheHelper.setSecuerString(
        key: StorageKeys.accessToken,
        value: newAccessToken,
      );
      return newAccessToken;
    } catch (error) {
      navigateToLogin();
    }
    return null;
  }
}

String getHeaderLang() {
  if (CacheHelper.getData(key: StorageKeys.lang) == null) {
    return "ar-eg";
  } else if (CacheHelper.getData(key: StorageKeys.lang) == 'ar') {
    return "ar-eg";
  } else {
    return "en-us";
  }
}

/// Helper method to create a new FormData instance from the original
Future<FormData> _createFormDataFromRequest(dynamic originalData) async {
  if (originalData is FormData) {
    // Recreate the FormData fields
    Map<String, dynamic> fields = {};
    for (var field in originalData.fields) {
      fields[field.key] =
          field.value; // You might need to handle files separately
    }

    // If there are files, recreate them
    for (var file in originalData.files) {
      // returning a new instance of the same object. This is useful if your request failed and you wish to retry it
      MultipartFile imageFile = file.value.clone();
      fields[file.key] = imageFile;
    }
    FormData newFormData = FormData.fromMap(fields);
    return newFormData;
  }
  return FormData(); // Return an empty FormData if it's not the expected type
}
*/
