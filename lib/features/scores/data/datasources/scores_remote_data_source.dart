import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';

import 'package:sports_app/features/scores/data/models/scores_model.dart';
import 'package:sports_app/features/scores/data/models/sport_model.dart';

abstract class ScoresRemoteDataSource {
  Future<List<ScoresModel>> getScoresBySportKey(String name);
  Future<List<SportModel>> getSportList();
}

class ScoresRemoteDataSourceImpl implements ScoresRemoteDataSource {
  final http.Client client;

  ScoresRemoteDataSourceImpl({required this.client});

  @override
  Future<
      List<
          ScoresModel>> getScoresBySportKey(String key) => _getScoresFromUrl(
      'https://api.the-odds-api.com/v4/sports/$key/scores/?daysFrom=3&apiKey=94f7a66c828da4e00f996a95144160cb');

  Future<List<ScoresModel>> _getScoresFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    print(response.body);
    if (response.statusCode == 200) {
      final result = List<ScoresModel>.from(
          json.decode(response.body).map((x) => ScoresModel.fromJson(x)));
      return result;
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<List<SportModel>> getSportList() => _getSportsFromUrl(
      'https://api.the-odds-api.com/v4/sports/?apiKey=94f7a66c828da4e00f996a95144160cb');

  Future<List<SportModel>> _getSportsFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final result = List<SportModel>.from(
          json.decode(response.body).map((x) => SportModel.fromJson(x)));
      return result;
    } else {
      throw ServerFailure();
    }
  }
}
