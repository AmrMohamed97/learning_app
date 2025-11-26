// import 'package:talamiz_arina/core/models/auth_response/auth_response.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class AssignImageState extends RegistrationState {}

// class RegistrationFailure extends RegistrationState {
//   final String message;

//   RegistrationFailure({required this.message});
// }

// class RegistrationSuccess extends RegistrationState {
//   final AuthResponse response;
//   RegistrationSuccess(this.response);
// }

// class RegistrationLoading extends RegistrationState {}
