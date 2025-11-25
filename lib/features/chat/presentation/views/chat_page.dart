import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/chat/data/models/chat.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/messages_list.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/send_message_widget.dart';

class ChatPage extends StatelessWidget {
  final Chat chat;
  const ChatPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: const SendMessageWidget(isActive: true),
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.chatUser.name, style: AppTextStyle.font16SemiBold),
                const SizedBox(height: 4),
                if (chat.chatUser.isActive)
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 12, color: Colors.green),
                      const SizedBox(width: 4),
                      Text("نشط الآن", style: AppTextStyle.font14Regular),
                    ],
                  ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 28),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: MessagesList(chat: chat),
      ),
    );
  }
}
