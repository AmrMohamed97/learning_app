import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final Color? borderColor;
  final Widget? child;
  final double? height;
  final bool? isLoading;
  const MyButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.width,
    this.textColor,
    this.borderColor,
    this.child,
    this.height,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 50),
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: color ?? MyColors.purpleNormal,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.5,
          ),
        ),
      ),
      child: isLoading == true
          ? const Center(child: CupertinoActivityIndicator())
          : child ?? Text(text, style: AppTextStyle.font16Medium),
    );
  }
}
