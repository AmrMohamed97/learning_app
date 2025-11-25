import 'data.dart';

class AdsModel {
  bool? status;
  String? message;
  Data? data;

  AdsModel({this.status, this.message, this.data});

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.toJson(),
  };
}
