import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMassage;

  Failure(this.errorMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMassage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          'Timeout occurred while sending the request to the server',
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          'Timeout occurred while receiving data from the server',
        );
      case DioExceptionType.cancel:
        return ServerFailure('The request to the server was canceled');
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with the server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Certificate error when connecting to the server');
      case DioExceptionType.badResponse:
        return ServerFailure('Invalid response from the server');
      case DioExceptionType.connectionError:
        return ServerFailure('Error while connecting to the server');
      case DioExceptionType.unknown:
        return ServerFailure('Unknown error when connecting to the server');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error_message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your response is not found , please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error ,  please try later!');
    }
    return ServerFailure('Opps there was an error , please try later!');
  }
}
