class User {
  User({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userLat,
    this.userLong,
    this.userAddress,
    this.userLang,
    this.userStatus,
    this.userActive,
    this.userImg,
  });

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userLat = json['user_lat'];
    userLong = json['user_long'];
    userAddress = json['user_address'];
    userLang = json['user_lang'];
    userStatus = json['user_status'];
    userActive = json['user_active'];
    userImg = json['user_img'];
  }
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  dynamic userLat;
  dynamic userLong;
  String? userAddress;
  String? userLang;
  String? userStatus;
  bool? userActive;
  dynamic userImg;
  User copyWith({
    int? userId,
    String? userName,
    String? userEmail,
    String? userPhone,
    dynamic userLat,
    dynamic userLong,
    String? userAddress,
    String? userLang,
    String? userStatus,
    bool? userActive,
    dynamic userImg,
  }) => User(
    userId: userId ?? this.userId,
    userName: userName ?? this.userName,
    userEmail: userEmail ?? this.userEmail,
    userPhone: userPhone ?? this.userPhone,
    userLat: userLat ?? this.userLat,
    userLong: userLong ?? this.userLong,
    userAddress: userAddress ?? this.userAddress,
    userLang: userLang ?? this.userLang,
    userStatus: userStatus ?? this.userStatus,
    userActive: userActive ?? this.userActive,
    userImg: userImg ?? this.userImg,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['user_email'] = userEmail;
    map['user_phone'] = userPhone;
    map['user_lat'] = userLat;
    map['user_long'] = userLong;
    map['user_address'] = userAddress;
    map['user_lang'] = userLang;
    map['user_status'] = userStatus;
    map['user_active'] = userActive;
    map['user_img'] = userImg;
    return map;
  }
}
