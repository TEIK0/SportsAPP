import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';

import 'package:sports_app/features/teams/data/models/teams_model.dart';

abstract class TeamsRemoteDataSource {
  Future<TeamModel> getTeamsListByName(String name);
}

class TeamsRemoteDataSourceImpl implements TeamsRemoteDataSource {
  final http.Client client;

  TeamsRemoteDataSourceImpl({required this.client});

  @override
  Future<TeamModel> getTeamsListByName(String key) => _getTeamsFromUrl(
      'https://sportscore1.p.rapidapi.com/teams/search?name=$key');

  Future<TeamModel> _getTeamsFromUrl(String url) async {
    final response = await client.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': 'ccbf9f952fmsh33f62b3f323a828p19c75cjsn8c5bdb9e83f5',
      'X-RapidAPI-Host': 'sportscore1.p.rapidapi.com',
      'charset': 'utf-8'
    });
    if (response.statusCode == 200) {
      final result = TeamModel.fromJson(json.decode(response.body));

      return result;
    } else {
      throw ServerFailure();
    }
  }
}
