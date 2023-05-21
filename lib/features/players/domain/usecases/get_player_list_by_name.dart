import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/player.dart';
import '../repositories/player_repository.dart';

class GetPlayerListByName implements UseCase<Players, String> {
  final PlayerRepository repository;

  GetPlayerListByName(this.repository);

  @override
  Future<Either<Failure, Players>> call(String name) async {
    return await repository.getPlayerListByName(name);
  }
}
