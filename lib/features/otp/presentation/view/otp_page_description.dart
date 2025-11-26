import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class OtpPageDescription extends StatelessWidget {
  const OtpPageDescription({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'تحقق من رسائل موبايلك',
          style: AppTextStyle.font16SemiBold.copyWith(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: AppTextStyle.font16Regular.copyWith(
              color: Colors.black,
              fontFamily: "sf-arabic-rounded",
            ),
            children: [
              TextSpan(
                text:
                    'من فضلك أدخل رمز التحقق المرسل إلى $phoneNumber يمكنك التحقق من الموبايل ',
              ),
              TextSpan(
                text: ' تعديل',
                style: AppTextStyle.font16Regular.copyWith(
                  decoration: TextDecoration.underline,
                  color: MyColors.purpleNormal,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push(PagesKeys.loginPage);
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
