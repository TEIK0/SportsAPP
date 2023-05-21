import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sports_app/core/error/failure.dart';

import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart';
import 'package:sports_app/features/scores/data/models/scores_model.dart';
import 'package:sports_app/features/scores/data/models/sport_model.dart';
import 'package:sports_app/features/scores/data/repositories/scores_repository_impl.dart';
import 'package:sports_app/features/scores/domain/entities/scores.dart';
import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/presentation/bloc/scores_bloc.dart';
import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<ScoresRepositoryImpl>(), MockSpec<http.Client>()])
import 'scores_bloc_tets.mocks.dart';

void main() {
  late ScoresBloc bloc;
  late MockScoresRepositoryImpl mockRepository;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    mockRepository = MockScoresRepositoryImpl();

    bloc = ScoresBloc(remote: mockRepository);
  });

  test('initial State should be Empty', () {
    expect(bloc.state, equals(Empty()));
  });

  group('Get Sports', () {
    final sportListTry = List<SportModel>.from(json
        .decode(fixture('sports_search.json'))
        .map((x) => SportModel.fromJson(x)));
    final List<Sport> sportsTry = sportListTry;

    test('should get data from the concrete use case', () async {
      when(mockRepository.getSportsList())
          .thenAnswer((_) async => Right(sportsTry));
      bloc.add(const GetSportsListEvent());
      await untilCalled(mockRepository.getSportsList());
      verify(mockRepository.getSportsList());
    });
    test('Should emit[Loading,Loaded] when data is gotten succesfully',
        () async {
      when(mockRepository.getSportsList())
          .thenAnswer((_) async => Right(sportsTry));
      final expected = [Loading(), LoadedSports(sports: sportsTry)];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const GetSportsListEvent());
    });
    test('Should emit[Loading,Error] when getting data fails', () async {
      when(mockRepository.getSportsList())
          .thenAnswer((_) async => Left(ServerFailure()));
      final expected = [Loading(), const Error(message: serverFailureMessage)];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const GetSportsListEvent());
    });
  });

  group('Get Scores By SportKey', () {
    const input = 'americanfootball_nfl';

    final scoreListTry = List<ScoresModel>.from(json
        .decode(fixture('scores_search.json'))
        .map((x) => ScoresModel.fromJson(x)));
    final List<Scores> scoresTry = scoreListTry;

    test('should get data from the concrete use case', () async {
      when(mockRepository.getScoresBySportKey(any))
          .thenAnswer((_) async => Right(scoresTry));
      bloc.add(const GetScoresListEvent(input));
      await untilCalled(mockRepository.getScoresBySportKey(any));
      verify(mockRepository.getScoresBySportKey(input));
    });
    test('Should emit[Loading,Loaded] when data is gotten succesfully',
        () async {
      when(mockRepository.getScoresBySportKey(any))
          .thenAnswer((_) async => Right(scoresTry));
      final expected = [Loading(), LoadedScores(scores: scoresTry)];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const GetScoresListEvent(input));
    });
    test('Should emit[Loading,Error] when getting data fails', () async {
      when(mockRepository.getScoresBySportKey(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      final expected = [Loading(), const Error(message: serverFailureMessage)];
      expectLater(bloc.stream, emitsInOrder(expected));
      bloc.add(const GetScoresListEvent(input));
    });
  });
}
