import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/filter_tag.dart';

class FilterContainer<T> extends StatelessWidget {
  final String title;
  final List<(String, T)> items;
  final bool Function(T) isChosen;
  final void Function(T value) onToggle;
  final bool horizontal;
  final IconData? icon;

  const FilterContainer({
    super.key,
    required this.title,
    required this.items,
    required this.isChosen,
    required this.onToggle,
    this.horizontal = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.font16SemiBold),
          const SizedBox(height: 10),

          if (horizontal)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var item in items)
                    FilterTag<T>(
                      text: item.$1,
                      value: item.$2,
                      isChosen: isChosen(item.$2),
                      onTap: onToggle,
                      icon: icon,
                    ),
                ],
              ),
            ),

          if (!horizontal)
            Wrap(
              children: [
                for (var item in items)
                  FilterTag<T>(
                    text: item.$1,
                    value: item.$2,
                    isChosen: isChosen(item.$2),
                    onTap: onToggle,
                    icon: icon,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
