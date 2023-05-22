import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sports_app/core/error/failure.dart';
import 'package:sports_app/features/teams/data/datasources/teams_remote_data_source.dart';
import 'package:sports_app/features/teams/data/models/teams_model.dart';

import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
import 'teams_remote_data_source_test.mocks.dart';

void main() {
  late TeamsRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = TeamsRemoteDataSourceImpl(client: mockHttpClient);
  });
  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.post(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('teams_search.json'), 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
            }));
  }

  void setUpMockHttpClientFail404() {
    when(mockHttpClient.post(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('teams_search.json'), 404, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
            }));
  }

  group('get Players by name', () {
    const input = "madrid";
    test('should Get a request on a URL', () async {
      setUpMockHttpClientSuccess200();
      dataSource.getTeamsListByName(input);
      verify(mockHttpClient.post(
          Uri.parse(
              'https://sportscore1.p.rapidapi.com/teams/search?name=$input'),
          headers: {
            'Content-Type': 'application/json',
            'X-RapidAPI-Key':
                'ccbf9f952fmsh33f62b3f323a828p19c75cjsn8c5bdb9e83f5',
            'X-RapidAPI-Host': 'sportscore1.p.rapidapi.com',
            'charset': 'utf8'
          }));
    });

    test('should return Players when the response is 200(success)', () async {
      setUpMockHttpClientSuccess200();
      final result = await dataSource.getTeamsListByName(input);
      expect(result, isA<TeamModel>());
    });

    test('should throw a ServerExeption when the response code is 404 or other',
        () async {
      setUpMockHttpClientFail404();
      final call = dataSource.getTeamsListByName(input);
      expect(
        () => call,
        throwsA(ServerFailure()),
      );
    });
  });
}
