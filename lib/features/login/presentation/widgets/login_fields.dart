import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';
import 'package:talamiz_arina/core/widgets/my_phone_number_form_field.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_state.dart';

class LoginEmailFields extends StatelessWidget {
  const LoginEmailFields({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: cubit.currentTabIndex == 0
                  ? _buildFieldWithTitle(
                      "رقم الهاتف",
                      MyPhoneNumberFormField(
                        controller: cubit.phoneController,
                        hintText: "أدخل رقم الهاتف",
                      ),
                      key: ValueKey(cubit.currentTabIndex == 0),
                    )
                  : _buildFieldWithTitle(
                      "البريد الالكتروني",
                      MyTextFormField(
                        controller: cubit.emailController,
                        hintText: "أدخل البريد الالكتروني",
                        suffixImg: Assets.assetsImagesSvgEmail,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          if (!Validator.validateEmail(value)) {
                            return "تأكد من كتابة البريد الإلكتروني بشكل صحيح.";
                          }
                          return null;
                        },
                      ),
                      key: ValueKey(cubit.currentTabIndex == 0),
                    ),
            ),
            _buildFieldWithTitle(
              "كلمة المرور",
              MyTextFormField(
                controller: cubit.passwordController,
                hintText: "أدخل كلمة المرور",
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "هذا الحقل مطلوب";
                  }
                  if (value.length < 8) {
                    return "يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وتشمل حروفًا وأرقامًا";
                  }
                  return null;
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFieldWithTitle(String title, Widget field, {Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(title, style: AppTextStyle.font16Medium),
        const SizedBox(height: 12),
        field,
      ],
    );
  }
}
