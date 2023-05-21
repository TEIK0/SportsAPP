import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/error/failure.dart';

import 'package:sports_app/features/players/data/models/player_model.dart';

abstract class PlayersRemoteDataSource {
  Future<PlayerModel> getPlayersByName(String name);
}

class PlayersRemoteDataSourceImpl implements PlayersRemoteDataSource {
  final http.Client client;

  PlayersRemoteDataSourceImpl({required this.client});

  @override
  Future<PlayerModel> getPlayersByName(String key) => _getPlayersFromUrl(
      'https://sportscore1.p.rapidapi.com/players/search?name=$key');

  Future<PlayerModel> _getPlayersFromUrl(String url) async {
    final response = await client.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'X-RapidAPI-Key': 'ccbf9f952fmsh33f62b3f323a828p19c75cjsn8c5bdb9e83f5',
      'X-RapidAPI-Host': 'sportscore1.p.rapidapi.com',
      'charset': 'utf8'
    });
    if (response.statusCode == 200) {
      final result = PlayerModel.fromJson(json.decode(response.body));
      return result;
    } else {
      throw ServerFailure();
    }
  }
}
