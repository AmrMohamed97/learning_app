import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/date_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/chat/data/models/chat_message.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/day_widget.dart';

class OtherMessageItem extends StatelessWidget {
  final ChatMessage message;
  final bool isNewDay;
  const OtherMessageItem({
    super.key,
    required this.message,
    required this.isNewDay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isNewDay) DayWidget(timestamp: message.timestamp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: MyColors.purpleNormal,
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                  topStart: Radius.circular(16),
                ),
              ),
              child: Text(
                message.content,
                style: AppTextStyle.font14Medium.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              DateHelper.formatTime12Hour(message.timestamp),
              style: AppTextStyle.font14Regular,
            ),
          ],
        ),
      ],
    );
  }
}
