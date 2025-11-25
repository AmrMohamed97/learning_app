import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class PasswordActions extends StatefulWidget {
  final Function(bool) onRememberMeChanged;
  const PasswordActions({super.key, required this.onRememberMeChanged});

  @override
  State<PasswordActions> createState() => _PasswordActionsState();
}

class _PasswordActionsState extends State<PasswordActions> {
  late bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                    widget.onRememberMeChanged(value!);
                  },
                  side: const BorderSide(
                    color: MyColors.purpleNormal,
                    width: 1.1,
                  ),
                ),
              ),
             Text("تذكرني", style: AppTextStyle.font16Medium),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            context.push(PagesKeys.forgotPasswordPage);
          },
          child:   Text(
            "هل نسيت كلمة المرور؟",
            style: AppTextStyle.font16Medium,
          ),
        ),
      ],
    );
  }
}
