import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:sports_app/features/players/data/models/player_model.dart';
import 'package:sports_app/features/players/domain/entities/player.dart';
import 'package:sports_app/features/players/domain/repositories/player_repository.dart';
import 'package:sports_app/features/players/domain/usecases/get_player_list_by_name.dart';

@GenerateNiceMocks([MockSpec<PlayerRepository>()])
import 'get_player_list_by_name_test.mocks.dart';

void main() {
  late GetPlayerListByName getPlayerListByName;
  late MockPlayerRepository mockPlayerRepository;

  setUp(() {
    mockPlayerRepository = MockPlayerRepository();
    getPlayerListByName = GetPlayerListByName(mockPlayerRepository);
  });

  const input = "messi";

  List<Datum> datumModel = [
    Datum(
        id: 1,
        sportId: 1,
        slug: '',
        name: '',
        hasPhoto: false,
        photo: '',
        dateBirthAt: ''),
    Datum(
        id: 1,
        sportId: 1,
        slug: '',
        name: '',
        hasPhoto: false,
        photo: '',
        dateBirthAt: '')
  ];

  Players listModel = Players(data: datumModel);

  test('should get a Player By Name', () async {
    when(mockPlayerRepository.getPlayerListByName(any))
        .thenAnswer((_) async => Right(listModel));
    final result = await getPlayerListByName(input);
    print("resultado: ${result.runtimeType}");
    print("modelo: ${listModel.runtimeType}");
    expect(result, Right(listModel));
    verify(mockPlayerRepository.getPlayerListByName(input));
    verifyNoMoreInteractions(mockPlayerRepository);
  });
}
