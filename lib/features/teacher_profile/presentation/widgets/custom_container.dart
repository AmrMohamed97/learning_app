import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.borderColor,
    this.color,
    required this.title,
    this.textColor,
    this.fontweight,
    this.fontSize,
    this.radius,
  });
  final Color? borderColor, color, textColor;
  final String title;
  final FontWeight? fontweight;
  final double? fontSize, radius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 16),
        border: Border.all(color: borderColor ?? Colors.transparent),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.font16Medium.copyWith(
            color: textColor,
            fontWeight: fontweight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
