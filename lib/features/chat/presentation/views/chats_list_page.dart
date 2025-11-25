import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/chat/data/models/test_data.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/chat_widget.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/no_chats_widget.dart';
import 'package:talamiz_arina/core/widgets/search_field.dart';

class ChatsListPage extends StatelessWidget {
  const ChatsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      maxWidth: 700,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SafeArea(
          child: dummyChats.isEmpty
              ? const NoChatsWidget()
              : Column(
                  children: [
                    const SizedBox(height: 16),
                    SearchField(controller: TextEditingController()),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ChatWidget(chat: dummyChats[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(height: 20);
                        },
                        itemCount: dummyChats.length,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
