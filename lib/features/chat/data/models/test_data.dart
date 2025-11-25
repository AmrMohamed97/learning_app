import 'package:talamiz_arina/features/chat/data/models/chat.dart';
import 'package:talamiz_arina/features/chat/data/models/chat_message.dart';
import 'package:talamiz_arina/features/chat/data/models/chat_user.dart';

final userA = ChatUser(
  id: "u1",
  name: "Mohamed",
  avatarUrl:
      'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f',
);

final userB = ChatUser(
  id: "u2",
  name: "محمود عبد الله",
  isActive: true,
  avatarUrl:
      'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f',
);

final userC = ChatUser(
  id: "u3",
  name: "محمد العتيبي",
  avatarUrl:
      'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f',
);

final dummyChats = <Chat>[
  Chat(
    id: "chat1",
    chatUser: userB,
    unreadCount: 1,
    lastMessage: ChatMessage(
      id: "m3",
      senderId: "u1",
      content: "All good 😄",
      receiverId: "u2",
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    messages: [
      ChatMessage(
        id: "m1",
        senderId: "u1",
        content: "Hey Sara! How are you?",
        receiverId: "u2",
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      ),
      ChatMessage(
        id: "m2",
        senderId: "u2",
        content: "I'm good! What about you?",
        receiverId: "u1",
        timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      ),
      ChatMessage(
        id: "m3",
        senderId: "u1",
        content: "All good 😄",
        receiverId: "u2",
        timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ],
  ),

  // Second Chat
  Chat(
    id: "chat2",
    chatUser: userC,
    unreadCount: 2,
    lastMessage: ChatMessage(
      id: "m6",
      senderId: "u1",
      content: "Nice one 🔥",
      receiverId: "u3",
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    messages: [
      ChatMessage(
        id: "m5",
        senderId: "u3",
        content: "Check this picture!",
        receiverId: "u1",
        timestamp: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 2, days: 1),
        ),
      ),
      ChatMessage(
        id: "m4",
        senderId: "u3",
        content: "https://dummyimage.com/400x400",
        receiverId: "u1",
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      ChatMessage(
        id: "m6",
        senderId: "u1",
        content: "Nice one 🔥",
        receiverId: "u3",
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
    ],
  ),
];
