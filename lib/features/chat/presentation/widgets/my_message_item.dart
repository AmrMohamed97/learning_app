import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/date_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/chat/data/models/chat_message.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/day_widget.dart';

class MyMessageItem extends StatelessWidget {
  final ChatMessage message;
  final bool isNewDay;
  const MyMessageItem({
    super.key,
    required this.message,
    required this.isNewDay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isNewDay) DayWidget(timestamp: message.timestamp),
        const SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: MyColors.darkBlueNormalHover,
                borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                  bottomEnd: Radius.circular(16),
                ),
              ),
              child: Text(message.content, style: AppTextStyle.font14Medium),
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
