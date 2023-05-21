import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:sports_app/core/error/failure.dart';

import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart';
import 'package:sports_app/features/scores/data/models/scores_model.dart';
import 'package:sports_app/features/scores/data/models/sport_model.dart';

import '../../../../fixtures/fixture_reader.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'scores_remote_data_source_test.mocks.dart';

void main() {
  late ScoresRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = ScoresRemoteDataSourceImpl(client: mockHttpClient);
  });
  void setUpMockHttpClientSuccess200Scores() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('scores_search.json'), 200));
  }

  void setUpMockHttpClientSuccess200Sports() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('Sports_search.json'), 200));
  }

  void setUpMockHttpClientFail404Scores() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('scores_search.json'), 404));
  }

  void setUpMockHttpClientFail404Sportss() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture('sports_search.json'), 404));
  }

  group('get scores by sport Key', () {
    const input = "americanfootball_nfl";
    test('should Get a request on a URL', () async {
      setUpMockHttpClientSuccess200Scores();
      dataSource.getScoresBySportKey(input);
      verify(mockHttpClient.get(
          Uri.parse(
              'http://api.the-odds-api.com/v4/sports/$input/scores/?daysFrom=1&apiKey=94f7a66c828da4e00f996a95144160cb'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return Scores when the response is 200(success)', () async {
      setUpMockHttpClientSuccess200Scores();
      final result = await dataSource.getScoresBySportKey(input);
      expect(result, isA<List<ScoresModel>>());
    });

    test('should throw a ServerExeption when the response code is 404 or other',
        () async {
      setUpMockHttpClientFail404Scores();
      final call = dataSource.getScoresBySportKey;
      expect(
        () => call(input),
        throwsA(ServerFailure()),
      );
    });
  });

  group('get sports list', () {
    test('should Get a request on a URL', () async {
      setUpMockHttpClientSuccess200Sports();
      dataSource.getSportList();
      verify(mockHttpClient.get(
          Uri.parse(
              'https://api.the-odds-api.com/v4/sports/?apiKey=94f7a66c828da4e00f996a95144160cb'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return Sports when the response is 200(success)', () async {
      setUpMockHttpClientSuccess200Sports();
      final result = await dataSource.getSportList();
      expect(result, isA<List<SportModel>>());
    });

    test(
        'should throw a ServerExeption trying a random number when the response code is 404 or other',
        () async {
      setUpMockHttpClientFail404Sportss();
      final call = dataSource.getSportList();
      expect(() => call, throwsA(ServerFailure()));
    });
  });
}
