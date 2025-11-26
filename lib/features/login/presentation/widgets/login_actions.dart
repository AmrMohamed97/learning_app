import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_state.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/auth_with_accounts_row.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: cubit.isValid,
              builder: (context, value, child) {
                if (value) {
                  return MyButton(
                        text: "ادخل الساحة",
                        onPressed: () {
                          if (context
                                  .read<LoginCubit>()
                                  .formKey
                                  .currentState
                                  ?.validate() ==
                              true) {
                            context.push(
                              PagesKeys.otpPage,
                              extra: ('+201092394069', PagesKeys.homePage),
                            );
                          }
                        },
                      )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 2.seconds, delay: 2.seconds);
                } else {
                  return const MyButton(text: "ادخل الساحة");
                }
              },
            )
                .animate()
                .fade(delay: 700.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0, delay: 700.ms, duration: 600.ms),
            const SizedBox(height: 24),
            const AuthWithAccountsRow()
                .animate()
                .fade(delay: 800.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0, delay: 800.ms, duration: 600.ms),
            const SizedBox(height: 24),
            RichText(
              text: TextSpan(
                text: "ليس لديك حساب؟",
                style: AppTextStyle.font16Medium.copyWith(
                  color: Colors.black,
                  fontFamily: "sf-arabic-rounded",
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push(PagesKeys.registerPage);
                      },
                    text: " افتح حساب جديد الان",
                    style: AppTextStyle.font16Medium.copyWith(
                      color: MyColors.purpleNormal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fade(delay: 900.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0, delay: 900.ms, duration: 600.ms),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
