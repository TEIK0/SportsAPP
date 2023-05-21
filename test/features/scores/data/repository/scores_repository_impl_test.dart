import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:sports_app/core/network/network_info.dart';

import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart';
import 'package:sports_app/features/scores/data/models/sport_model.dart';
import 'package:sports_app/features/scores/data/models/scores_model.dart';
import 'package:sports_app/features/scores/data/repositories/scores_repository_impl.dart';
import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/domain/entities/scores.dart';

import '../../../../fixtures/fixture_reader.dart';

@GenerateNiceMocks(
    [MockSpec<ScoresRemoteDataSourceImpl>(), MockSpec<NetworkInfo>()])
import 'scores_repository_impl_test.mocks.dart';

void main() {
  late ScoresRepositoryImpl repository;
  late MockScoresRemoteDataSourceImpl mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockScoresRemoteDataSourceImpl();
    mockNetworkInfo = MockNetworkInfo();
    repository = ScoresRepositoryImpl(
        network: mockNetworkInfo, remote: mockRemoteDataSource);
  });

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  group('Get Sports List', () {
    final sportListTry = List<SportModel>.from(json
        .decode(fixture('sports_search.json'))
        .map((x) => SportModel.fromJson(x)));

    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getSportsList();

      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('Should return remote data when the call is successfull', () async {
        when(mockRemoteDataSource.getSportList())
            .thenAnswer((_) async => sportListTry);
        final result = await repository.getSportsList();

        verify(mockRemoteDataSource.getSportList());
        final r = Right(result);
        print(r.runtimeType);
        print(sportListTry.runtimeType);
        expect(result, equals(Right(sportListTry)));
      });
    });
  });

  group('GetScoreList', () {
    final scoreListTry = List<ScoresModel>.from(json
        .decode(fixture('scores_search.json'))
        .map((x) => ScoresModel.fromJson(x)));
    const input = "soccer";
    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getScoresBySportKey(input);

      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('Should return remote data', () async {
        when(mockRemoteDataSource.getScoresBySportKey(any))
            .thenAnswer((_) async => scoreListTry);
        final result = await repository.getScoresBySportKey(input);

        verify(mockRemoteDataSource.getScoresBySportKey(input));
        final r = Right(result);
        print(r.runtimeType);
        print(scoreListTry.runtimeType);
        expect(result, equals(Right(scoreListTry)));
      });
    });
  });
}
