import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class PasswordActions extends StatelessWidget {
  // final Function(bool) onRememberMeChanged;
  const PasswordActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: RememberMeWidget()),
        TextButton(
          onPressed: () {
            context.push(PagesKeys.forgotPasswordPage);
          },
          child: Text("هل نسيت كلمة المرور؟", style: AppTextStyle.font16Medium),
        ),
      ],
    );
  }
}

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value!;
              });
            },
            side: const BorderSide(color: MyColors.purpleNormal, width: 1.1),
          ),
        ),
        Text("تذكرني", style: AppTextStyle.font16Medium),
      ],
    );
  }
}
