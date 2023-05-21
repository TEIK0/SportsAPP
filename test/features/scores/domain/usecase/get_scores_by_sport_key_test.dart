import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sports_app/core/usecases/usecases.dart';
import 'package:sports_app/features/scores/domain/entities/scores.dart';

import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/domain/usecases/get_scores_by_sport_key.dart';

import 'get_sports_list_test.mocks.dart';

void main() {
  late GetScoresBySport getScoresBySport;
  late MockScoresRepository mockScoresRepository;

  setUp(() {
    mockScoresRepository = MockScoresRepository();
    getScoresBySport = GetScoresBySport(mockScoresRepository);
  });

  const input = "soccer";

  DateTime now = DateTime.now();
  Scores score = Scores(
      awayTeam: '',
      commenceTime: now,
      homeTeam: '',
      id: '',
      completed: false,
      sportKey: '',
      sportTitle: '',
      scores: []);

  List<Scores> expected = [score];

  test('should get a Player By Name', () async {
    when(mockScoresRepository.getScoresBySportKey(input))
        .thenAnswer((_) async => Right(expected));
    final result = await getScoresBySport(input);
    expect(result, Right(expected));
    verify(mockScoresRepository.getScoresBySportKey(any));
    verifyNoMoreInteractions(mockScoresRepository);
  });
}
