import 'User.dart';

class Data {
  Data({this.user, this.token, this.tokenType});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    tokenType = json['token_type'];
  }
  User? user;
  String? token;
  String? tokenType;
  Data copyWith({User? user, String? token, String? tokenType}) => Data(
    user: user ?? this.user,
    token: token ?? this.token,
    tokenType: tokenType ?? this.tokenType,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    map['token_type'] = tokenType;
    return map;
  }
}
