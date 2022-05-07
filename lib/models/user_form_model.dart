// To parse this JSON data, do
//
//     final userFormModel = userFormModelFromJson(jsonString);

import 'dart:convert';

UserFormModel userFormModelFromJson(String str) =>
    UserFormModel.fromJson(json.decode(str));

String userFormModelToJson(UserFormModel data) => json.encode(data.toJson());

class UserFormModel {
  UserFormModel({
    required this.status,
    required this.message,
    this.errorCode,
    this.errorMsg,
    required this.data,
    this.metaParams,
  });

  bool status;
  String message;
  dynamic errorCode;
  dynamic errorMsg;
  Data data;
  dynamic metaParams;

  factory UserFormModel.fromJson(Map<String, dynamic> json) => UserFormModel(
        status: json["status"],
        message: json["message"],
        errorCode: json["error_code"],
        errorMsg: json["error_msg"],
        data: Data.fromJson(json["data"]),
        metaParams: json["meta_params"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "error_code": errorCode,
        "error_msg": errorMsg,
        "data": data.toJson(),
        "meta_params": metaParams,
      };
}

class Data {
  Data({
    required this.userId,
    required this.name,
    required this.email,
    required this.image,
    required this.dob,
    required this.gender,
    required this.userStatus,
    required this.isNew,
  });

  int userId;
  String name;
  String email;
  String image;
  String dob;
  String gender;
  String userStatus;
  bool isNew;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        dob: json["dob"],
        gender: json["gender"],
        userStatus: json["user_status"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
        "dob": dob,
        "gender": gender,
        "user_status": userStatus,
      };
}
