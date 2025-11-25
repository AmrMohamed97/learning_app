import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import '../../core/themes/styles/app_text_style.dart';
import '../../core/widgets/loading.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.onSecondaryTap,
    this.fixedSize = true,
    this.backgroundColor,
    this.horizontalPadding,
    this.height,
    this.isMax = false,
    this.radius,
    this.textColor,
    this.borderColor,
  });
  final String text;
  final VoidCallback? onPressed, onSecondaryTap;
  final bool loading;
  final bool fixedSize;
  final Color? backgroundColor, textColor, borderColor;
  final double? horizontalPadding, radius, height;
  final bool isMax;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 6),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            // width: 2,
          ),
        ),
        backgroundColor: backgroundColor ?? MyColors.purpleNormal,
        fixedSize: fixedSize ? Size.fromHeight(height ?? 46) : null,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: isMax ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                style: AppTextStyle.font16Medium.copyWith(
                  color: loading
                      ? Colors.transparent
                      : textColor ?? Colors.white,
                ),
                // textAlign: TextAlign.center,
              ),
              LoadingWidget(
                color: loading ? Colors.white : Colors.transparent,
                loadingSize: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
