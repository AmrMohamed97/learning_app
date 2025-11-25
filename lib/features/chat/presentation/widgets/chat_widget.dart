import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/date_helper.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/features/chat/data/models/chat.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;
  const ChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(PagesKeys.chatPage, extra: chat);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CustomCachedImage(
                width: 50,
                height: 50,
                url: chat.chatUser.avatarUrl,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat.chatUser.name, style: AppTextStyle.font16SemiBold),
                  const SizedBox(height: 8),
                  Text(
                    chat.lastMessage.content,
                    style: AppTextStyle.font14Regular,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  DateHelper.formatDate(chat.lastMessage.timestamp),
                  style: AppTextStyle.font14Regular,
                ),
                const SizedBox(height: 8),
                if (chat.unreadCount > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      chat.unreadCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeightHelper.regular,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
