import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_state.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/fileds_tab_bar.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/login_actions.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/password_actions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final _cubit = context.read<LoginCubit>();
        return ScreenWrapper(
         
          backGroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      key: _cubit.formKey,
                      child: const Column(
                        children: [
                          SizedBox(height: 48),
                          LogoHeading(
                            text:
                                "هلا والله بعودتك يا بطل"
                                "!",
                          ),
                          SizedBox(height: 20),
                          FiledsTabBar(),
                          PasswordActions(),
                          SizedBox(height: 20),
                          LoginActions()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
