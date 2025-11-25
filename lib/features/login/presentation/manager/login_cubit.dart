import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/login/data/repo/login_repo.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentTabIndex = 0;

  LoginCubit(this.loginRepo) : super(LoginInitial()) {
    emailController.addListener(() {
      validate();
    });
    passwordController.addListener(() {
      validate();
    });
    phoneController.addListener(() {
      validate();
    });
  }

  void validate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentTabIndex == 0) {
        isValid.value =
            phoneController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      } else {
        isValid.value =
            emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
