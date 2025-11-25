import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';

class CustomListTile extends StatelessWidget {
  final Widget title;
  final String value;
  final bool isSelected;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    required this.value,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        color: isSelected ? MyColors.purpleLightHover : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSelected
              ? MyColors.purpleNormalActive
              : MyColors.darkBlueNormalHover,
          width: 2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
            child: Row(
              mainAxisSize: .min,
              children: [
                Expanded(
                  child: title,
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Radio(
                    value: value,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
