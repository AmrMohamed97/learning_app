import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class UserTypeItem extends StatelessWidget {
  const UserTypeItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.isSelected = false,
  });
  final String image, title;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? MyColors.darkBlueDark.withValues(alpha: .5)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? MyColors.purpleNormal
                  : MyColors.darkBlueDark.withValues(alpha: .5),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, width: 90, height: 90),
              Text(
                title,
                style: AppTextStyle.font16SemiBold.copyWith(
                  color: MyColors.tealOflight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
