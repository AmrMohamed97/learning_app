abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  final String message;

  RegistrationFailure({required this.message});
}

class RegistrationSuccess extends RegistrationState {
  RegistrationSuccess();
}

class RegistrationLoading extends RegistrationState {}