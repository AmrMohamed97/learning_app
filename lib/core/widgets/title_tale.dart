import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class TitleTale extends StatelessWidget {
  const TitleTale({
    super.key,
    required this.title,
    this.option,
    this.onPressed,
  });
  final String title;
  final String? option;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: AppTextStyle.font20SemiBold)),
        GestureDetector(
          onTap: option == null ? null : onPressed,
          child: Text(option ?? '', style: AppTextStyle.font16Regular),
        ),
      ],
    );
  }
}
