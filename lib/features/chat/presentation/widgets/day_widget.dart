import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/date_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class DayWidget extends StatelessWidget {
  final DateTime timestamp;
  const DayWidget({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.purpleNormal,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Text(
          DateHelper.formatDate(timestamp),
          textAlign: TextAlign.center,
          style: AppTextStyle.font14SemiBold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
