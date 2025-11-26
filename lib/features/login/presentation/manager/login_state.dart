abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({required this.message});
}

class LoginSuccess extends LoginState {

  LoginSuccess();
}

class LoginLoading extends LoginState {}

class LoginTabChanged extends LoginState {}
