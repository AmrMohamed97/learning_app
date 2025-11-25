class UserData {
  final int id;
  final String name;
  final String lname;
  final String? email;
  final String phone;
  final String status;
  final String img;
  final String type;
  final int roleId;

  UserData({
    required this.id,
    required this.name,
    required this.lname,
    required this.email,
    required this.phone,
    required this.status,
    required this.img,
    required this.type,
    required this.roleId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      lname: json['lname'],
      email: json['email'],
      phone: json['phone'],
      status: json['status'],
      img: json['img'],
      type: json['type'],
      roleId: json['role_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'lname': lname,
      'email': email,
      'phone': phone,
      'status': status,
      'img': img,
      'type': type,
      'role_id': roleId,
    };
  }
}