// To parse this JSON data, do
//
//     final sportModel = sportModelFromJson(jsonString);

import 'dart:convert';

import 'package:sports_app/features/scores/domain/entities/sport.dart';

List<SportModel> sportModelFromJson(String str) =>
    List<SportModel>.from(json.decode(str).map((x) => SportModel.fromJson(x)));

String sportModelToJson(List<SportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SportModel extends Sport {
  const SportModel(
      {required String key,
      required String group,
      required String title,
      required bool active})
      : super(key: key, group: group, title: title, active: active);

  factory SportModel.fromJson(Map<String, dynamic> json) => SportModel(
        key: json["key"],
        group: json["group"],
        title: json["title"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "group": group,
        "title": title,
        "active": active,
      };
}
