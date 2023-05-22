// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/teams.dart';

TeamModel teamModelFromJson(String str) => TeamModel.fromJson(json.decode(str));

String teamModelToJson(TeamModel data) => json.encode(data.toJson());

class TeamModel extends Teams {
  const TeamModel({
    required List<DatumTeams> data,
  }) : super(data: data);

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        data: List<DatumTeams>.from(
            json["data"].map((x) => DatumTeams.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumTeams {
  int id;
  int sportId;
  String name;
  bool hasLogo;
  String logo;
  String? country;

  DatumTeams({
    required this.id,
    required this.sportId,
    required this.name,
    required this.hasLogo,
    required this.logo,
    required this.country,
  });

  factory DatumTeams.fromJson(Map<String, dynamic> json) => DatumTeams(
        id: json["id"],
        sportId: json["sport_id"],
        name: json["name"],
        hasLogo: json["has_logo"],
        logo: json["logo"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "name": name,
        "has_logo": hasLogo,
        "logo": logo,
        "country": country,
      };
}
