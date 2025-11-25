import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/fileds_tab_bar.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/login_actions.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/password_actions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit _cubit = context.read();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: LoginActions(isValid: _cubit.isValid),
      ),
      backGroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Form(
                  key: _cubit.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      const LogoHeading(
                        text:
                            "هلا والله بعودتك يا بطل"
                            "!",
                      ),
                      const SizedBox(height: 20),
                      FiledsTabBar(
                        emailController: _cubit.emailController,
                        passwordController: _cubit.passwordController,
                        phoneController: _cubit.phoneController,
                      ),
                      PasswordActions(
                        onRememberMeChanged: (value) {
                          _rememberMe = value;
                        },
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
