class ChatUser {
  final String id;
  final String name;
  final String? avatarUrl;
  final bool isActive;

  ChatUser({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.isActive = false,
  });

  factory ChatUser.fromMap(Map<String, dynamic> map) {
    return ChatUser(
      id: map['id'],
      name: map['name'],
      avatarUrl: map['avatarUrl'],
      isActive: map['isActive'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'isActive': isActive,
    };
  }
}
