import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';
import 'package:talamiz_arina/core/widgets/my_phone_number_form_field.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';

class LoginEmailFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final bool isUsingPhone;
  const LoginEmailFields({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
    required this.isUsingPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isUsingPhone
              ? _buildFieldWithTitle(
                  "رقم الهاتف",
                  MyPhoneNumberFormField(
                    controller: phoneController,
                    hintText: "أدخل رقم الهاتف",
                  ),
                  key: ValueKey(isUsingPhone),
                )
              : _buildFieldWithTitle(
                  "البريد الالكتروني",
                  MyTextFormField(
                    controller: emailController,
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
                  key: ValueKey(isUsingPhone),
                ),
        ),
        _buildFieldWithTitle(
          "كلمة المرور",
          MyTextFormField(
            controller: passwordController,
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
