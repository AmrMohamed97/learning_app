import 'package:flutter/material.dart';
import 'package:talamiz_arina/features/chat/data/models/chat.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/my_message_item.dart';
import 'package:talamiz_arina/features/chat/presentation/widgets/other_message_item.dart';

class MessagesList extends StatefulWidget {
  final Chat chat;
  const MessagesList({super.key, required this.chat});

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: widget.chat.messages.length < 20,
      itemCount: widget.chat.messages.length,
      itemBuilder: (context, index) {
        final message = widget.chat.messages[index];
        final isNewDay =
            index == 0 ||
            DateUtils.dateOnly(widget.chat.messages[index - 1].timestamp) !=
                DateUtils.dateOnly(message.timestamp);
        return message.senderId == "u1"
            ? MyMessageItem(message: message, isNewDay: isNewDay)
            : OtherMessageItem(message: message, isNewDay: isNewDay);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
    );
  }
}
