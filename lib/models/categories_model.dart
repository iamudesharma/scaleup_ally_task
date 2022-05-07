// To parse this JSON data, do
//
//     final categoriesModel = categoriesModelFromJson(jsonString);

import 'dart:convert';

CategoriesModel categoriesModelFromJson(String str) =>
    CategoriesModel.fromJson(json.decode(str));

String categoriesModelToJson(CategoriesModel data) =>
    json.encode(data.toJson());

class CategoriesModel {
  CategoriesModel({
    this.status,
    this.message,
    this.errorCode,
    this.errorMsg,
    this.data,
    this.metaParams,
  });

  bool? status;
  Message? message;
  dynamic errorCode;
  dynamic errorMsg;
  List<Datum>? data;
  dynamic metaParams;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        message: Message.fromJson(json["message"]),
        errorCode: json["error_code"],
        errorMsg: json["error_msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        metaParams: json["meta_params"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message?.toJson(),
        "error_code": errorCode,
        "error_msg": errorMsg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta_params": metaParams,
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.icon,
    this.banner,
    this.bgcolor,
  });

  int? id;
  Message? name;
  String? icon;
  dynamic banner;
  String? bgcolor;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: Message.fromJson(json["name"]),
        icon: json["icon"],
        banner: json["banner"],
        bgcolor: json["bgcolor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name?.toJson(),
        "icon": icon,
        "banner": banner,
        "bgcolor": bgcolor,
      };
}

class Message {
  Message({
    this.en,
    this.hi,
  });

  String? en;
  String? hi;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        en: json["EN"],
        hi: json["HI"],
      );

  Map<String, dynamic> toJson() => {
        "EN": en,
        "HI": hi,
      };
}
