import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/auth_with_accounts_row.dart';

class RegistrationActions extends StatelessWidget {
  const RegistrationActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ValueListenableBuilder(
          valueListenable: context.read<RegistrationCubit>().tabIndex,
          builder: (context, tabIndex, child) {
            return ValueListenableBuilder(
              valueListenable: context.read<RegistrationCubit>().isValid,
              builder: (context, value, child) {
                if (value) {
                  return MyButton(
                    text: tabIndex == 3 ? "ارسل رمز التحقق" : "يلا نكمل",
                    onPressed: () {
                      if (context
                              .read<RegistrationCubit>()
                              .formKey
                              .currentState
                              ?.validate() ==
                          false) {
                        return;
                      }
                      final tabIndex = context
                          .read<RegistrationCubit>()
                          .tabIndex;
                      if (tabIndex.value < 3) {
                        tabIndex.value++;
                      } else {
                        context.push(
                          PagesKeys.otpPage,
                          extra: ('+201092394069', PagesKeys.homePage),
                        );
                      }
                    },
                  );
                  // .animate(onPlay: (controller) => controller.repeat())
                  // .shimmer(duration: 2.seconds, delay: 2.seconds);
                } else {
                  return MyButton(
                    text: tabIndex == 3 ? "ارسل رمز التحقق" : "يلا نكمل",
                  );
                }
              },
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: context.read<RegistrationCubit>().tabIndex,
          builder: (context, tabIndex, child) {
            if (tabIndex == 0) {
              return const Column(
                children: [SizedBox(height: 24), AuthWithAccountsRow()],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        const SizedBox(height: 24),
        RichText(
          text: TextSpan(
            text: "لديك حساب؟",
            style: AppTextStyle.font16Medium.copyWith(
              color: Colors.black,
              fontFamily: "sf-arabic-rounded",
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push(PagesKeys.loginPage);
                  },
                text: " تسجيل الدخول",
                style: AppTextStyle.font16Medium.copyWith(
                  color: MyColors.purpleNormal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
