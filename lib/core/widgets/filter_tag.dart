import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class FilterTag<T> extends StatelessWidget {
  final String text;
  final Widget? child;
  final T value;
  final bool isChosen;
  final Function(T) onTap;
  final IconData? icon;
  const FilterTag({
    super.key,
    required this.text,
    this.child,
    required this.value,
    required this.isChosen,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        height: icon == null ? 48 : null,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: icon == null ? 0 : 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isChosen
                ? MyColors.purpleNormal
                : MyColors.darkBlueNormalHover,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Container(
                margin: const EdgeInsets.only(bottom: 11),
                child: Icon(
                  icon,
                  color: isChosen ? MyColors.purpleNormal : Colors.black,
                ),
              ),
            child ??
                Text(
                  text,
                  style: AppTextStyle.font16Regular.copyWith(
                    color: isChosen ? MyColors.purpleNormal : Colors.black,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
