// To parse this JSON data, do
//
//     final playerModel = playerModelFromJson(jsonString);

import 'dart:convert';

import 'package:sports_app/features/players/domain/entities/player.dart';

PlayerModel playerModelFromJson(String str) =>
    PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel extends Players {
  const PlayerModel({required List<Datum> data}) : super(data: data);

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final int sportId;
  final String slug;
  final String name;
  final bool hasPhoto;
  final String photo;
  final String? positionName;
  final int? weight;
  final int? age;
  final String dateBirthAt;
  final double? height;
  final int? shirtNumber;
  final String? nationalityCode;
  final String? flag;
  final MarketCurrency? marketCurrency;
  final int? marketValue;

  Datum({
    required this.id,
    required this.sportId,
    required this.slug,
    required this.name,
    required this.hasPhoto,
    required this.photo,
    this.positionName,
    this.weight,
    this.age,
    required this.dateBirthAt,
    this.height,
    this.shirtNumber,
    this.nationalityCode,
    this.flag,
    this.marketCurrency,
    this.marketValue,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sportId: json["sport_id"],
        slug: json["slug"],
        name: json["name"],
        hasPhoto: json["has_photo"],
        photo: json["photo"],
        positionName: json["position_name"],
        weight: json["weight"],
        age: json["age"],
        dateBirthAt: json["date_birth_at"],
        height: json["height"]?.toDouble(),
        shirtNumber: json["shirt_number"],
        nationalityCode: json["nationality_code"],
        flag: json["flag"],
        marketCurrency: marketCurrencyValues.map[json["market_currency"]],
        marketValue: json["market_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_id": sportId,
        "slug": slug,
        "name": name,
        "has_photo": hasPhoto,
        "photo": photo,
        "position_name": positionNameValues.reverse[positionName],
        "weight": weight,
        "age": age,
        "date_birth_at": dateBirthAt,
        "height": height,
        "shirt_number": shirtNumber,
        "nationality_code": nationalityCode,
        "flag": flag,
        "market_currency": marketCurrencyValues.reverse[marketCurrency],
        "market_value": marketValue,
      };
}

enum MarketCurrency { EUR, EMPTY }

final marketCurrencyValues =
    EnumValues({"€": MarketCurrency.EMPTY, "EUR": MarketCurrency.EUR});

enum PositionName { FORWARD, DEFENDER, MIDFIELDER, GOALKEEPER }

final positionNameValues = EnumValues({
  "Defender": PositionName.DEFENDER,
  "Forward": PositionName.FORWARD,
  "Goalkeeper": PositionName.GOALKEEPER,
  "Midfielder": PositionName.MIDFIELDER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

class Meta {
  final int currentPage;
  final int from;
  final int perPage;
  final int to;

  Meta({
    required this.currentPage,
    required this.from,
    required this.perPage,
    required this.to,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        perPage: json["per_page"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "per_page": perPage,
        "to": to,
      };
}
