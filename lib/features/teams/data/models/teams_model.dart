// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

import 'package:sports_app/features/teams/domain/entities/teams.dart';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel extends Teams {
  const TeamModel({
    required List<Datum> data,
  }) : super(data: data);

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int sportId;
  String name;
  bool hasLogo;
  String logo;
  bool hasSub;
  String gender;
  String country;

  Datum({
    required this.id,
    required this.sportId,
    required this.name,
    required this.hasLogo,
    required this.logo,
    required this.hasSub,
    required this.gender,
    required this.country,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sportId: json["sport_id"],
        name: json["name"],
        hasLogo: json["has_logo"],
        logo: json["logo"],
        hasSub: json["has_sub"],
        gender: json["gender"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "name": name,
        "has_logo": hasLogo,
        "logo": logo,
        "has_sub": hasSub,
        "gender": gender,
        "country": country,
      };
}
