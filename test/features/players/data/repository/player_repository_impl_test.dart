import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:sports_app/core/network/network_info.dart';

import 'package:sports_app/features/players/data/datasources/player_remote_data_source.dart';
import 'package:sports_app/features/players/data/models/player_model.dart';
import 'package:sports_app/features/players/data/repositories/player_repository_impl.dart';
import 'package:sports_app/features/players/domain/entities/player.dart';

import '../../../../fixtures/fixture_reader.dart';

@GenerateNiceMocks(
    [MockSpec<PlayersRemoteDataSourceImpl>(), MockSpec<NetworkInfo>()])
import 'player_repository_impl_test.mocks.dart';

void main() {
  late PlayerRepositoryImpl repository;
  late MockPlayersRemoteDataSourceImpl mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPlayersRemoteDataSourceImpl();
    mockNetworkInfo = MockNetworkInfo();
    repository = PlayerRepositoryImpl(
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
    final PlayerModel playerTry =
        PlayerModel.fromJson(json.decode(fixture('player_search.json')));
    const input = 'messi';

    test('should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getPlayerListByName(input);

      verify(mockNetworkInfo.isConnected);
    });

    runTestOnline(() {
      test('Should return remote data when the call is successfull', () async {
        when(mockRemoteDataSource.getPlayersByName(any))
            .thenAnswer((_) async => playerTry);
        final result = await repository.getPlayerListByName(input);

        verify(mockRemoteDataSource.getPlayersByName(any));
        final r = Right(result);
        print(r.runtimeType);
        print(playerTry.runtimeType);
        expect(result, equals(Right(playerTry)));
      });
    });
  });
}
