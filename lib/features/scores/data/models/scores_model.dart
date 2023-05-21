// To parse this JSON data, do
//
//     final scoresModel = scoresModelFromJson(jsonString);

import 'dart:convert';

import 'package:sports_app/features/scores/domain/entities/scores.dart';

List<ScoresModel> scoresModelFromJson(String str) => List<ScoresModel>.from(
    json.decode(str).map((x) => ScoresModel.fromJson(x)));

String scoresModelToJson(List<ScoresModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScoresModel extends Scores {
  const ScoresModel(
      {required String id,
      required String sportKey,
      required String sportTitle,
      required DateTime commenceTime,
      required bool completed,
      required String homeTeam,
      required String awayTeam,
      required List<Score>? scores,
      required DateTime? lastUpdate})
      : super(
            id: id,
            sportKey: sportKey,
            sportTitle: sportTitle,
            commenceTime: commenceTime,
            completed: completed,
            homeTeam: homeTeam,
            awayTeam: awayTeam,
            scores: scores);

  factory ScoresModel.fromJson(Map<String, dynamic> json) => ScoresModel(
        id: json["id"],
        sportKey: json["sport_key"],
        sportTitle: json["sport_title"],
        commenceTime: DateTime.parse(json["commence_time"]),
        completed: json["completed"],
        homeTeam: json["home_team"],
        awayTeam: json["away_team"],
        scores: json["scores"] == null
            ? []
            : List<Score>.from(json["scores"]!.map((x) => Score.fromJson(x))),
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sport_key": sportKey,
        "sport_title": sportTitle,
        "commence_time": commenceTime.toIso8601String(),
        "completed": completed,
        "home_team": homeTeam,
        "away_team": awayTeam,
        "scores": scores == null
            ? []
            : List<dynamic>.from(scores!.map((x) => x.toJson())),
        "last_update": lastUpdate?.toIso8601String(),
      };
}

class Score {
  final String name;
  final String score;

  Score({
    required this.name,
    required this.score,
  });

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        name: json["name"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "score": score,
      };
}
