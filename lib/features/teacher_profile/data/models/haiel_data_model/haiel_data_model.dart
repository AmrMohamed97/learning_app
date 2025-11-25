import 'craft_model.dart';

class HaielDataModel {
  bool? status;
  String? message;
  List<CraftModel>? data;

  HaielDataModel({this.status, this.message, this.data});

  factory HaielDataModel.fromJson(Map<String, dynamic> json) {
    return HaielDataModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CraftModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };
}
