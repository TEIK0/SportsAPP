import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sports_app/core/usecases/usecases.dart';

import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/domain/repositories/scores_repository.dart';
import 'package:sports_app/features/scores/domain/usecases/get_sports_list.dart';

@GenerateNiceMocks([MockSpec<ScoresRepository>()])
import 'get_sports_list_test.mocks.dart';

void main() {
  late GetSportsList getSportsList;
  late MockScoresRepository mockScoresRepository;

  setUp(() {
    mockScoresRepository = MockScoresRepository();
    getSportsList = GetSportsList(mockScoresRepository);
  });

  const input = "messi";

  const sport = Sport(group: '', key: '', title: '', active: false);

  const expected = [sport];

  test('should get a Player By Name', () async {
    when(mockScoresRepository.getSportsList())
        .thenAnswer((_) async => const Right(expected));
    final result = await getSportsList(NoParams());
    expect(result, const Right(expected));
    verify(mockScoresRepository.getSportsList());
    verifyNoMoreInteractions(mockScoresRepository);
  });
}
