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
        final cubit = context.read<LoginCubit>();
        return ScreenWrapper(
          backGroundColor: Colors.white,
          topSafeArea:
              false, // Disable topSafeArea to let background cover status bar
          body: Stack(
            children: [
              // Subtle Background Gradient
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xFFFDFBF7), // Very faint orange/warm white
                      Color(0xFFF9F5FF), // Very faint purple/cool white
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),

              // Main Content
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Form(
                          key: cubit.formKey,
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
                              LoginActions(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
