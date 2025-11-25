abstract class Failure {
  final int? code;
  final String? message;

  const Failure({this.code, this.message});
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DefaultFailure extends Failure {
  const DefaultFailure({int? code, String? message})
      : super(code: code, message: message);
}

class LocationFailure extends Failure {
  const LocationFailure() : super(message: 'enableLocation');
}

class AuthFailure extends Failure {
  const AuthFailure({int? code, String? message})
      : super(message: message ?? 'loginRequired');
}

class BiometricFailure extends Failure {
  const BiometricFailure({int? code, String? message})
      : super(message: message ?? 'failedToAuthenticate');
}
