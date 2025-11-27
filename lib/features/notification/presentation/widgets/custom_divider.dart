import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 1,
      color: MyColors.purpleLight,
      indent: 16,
      endIndent: 16,
    );
  }
}
