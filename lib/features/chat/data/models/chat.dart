import 'package:talamiz_arina/features/chat/data/models/chat_message.dart';
import 'package:talamiz_arina/features/chat/data/models/chat_user.dart';

class Chat {
  final String id;
  final ChatUser chatUser;
  final ChatMessage lastMessage;
  final String? lastSenderId;
  final int unreadCount;
  final List<ChatMessage> messages;

  Chat({
    required this.id,
    required this.chatUser,
    required this.lastMessage,
    this.lastSenderId,
    this.unreadCount = 0,
    this.messages = const [],
  });

  Chat copyWith({
    String? id,
    ChatUser? chatUser,
    ChatMessage? lastMessage,
    DateTime? lastMessageTime,
    String? lastSenderId,
    int? unreadCount,
    List<ChatMessage>? messages,
  }) {
    return Chat(
      id: id ?? this.id,
      chatUser: chatUser ?? this.chatUser,
      lastMessage: lastMessage ?? this.lastMessage,
      lastSenderId: lastSenderId ?? this.lastSenderId,
      unreadCount: unreadCount ?? this.unreadCount,
      messages: messages ?? this.messages,
    );
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      id: map['id'],
      chatUser: ChatUser.fromMap(map['chatUser']),
      lastMessage: ChatMessage.fromMap(map['lastMessage']),
      lastSenderId: map['lastSenderId'],
      unreadCount: map['unreadCount'] ?? 0,
      messages: (map['messages'] as List)
          .map((m) => ChatMessage.fromMap(m))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatUser': chatUser.toMap(),
      'lastMessage': lastMessage.toMap(),
      'lastSenderId': lastSenderId,
      'unreadCount': unreadCount,
      'messages': messages.map((m) => m.toMap()).toList(),
    };
  }
}
