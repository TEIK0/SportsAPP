import 'package:dartz/dartz.dart';
import 'package:sports_app/features/players/domain/entities/player.dart';

import '../../../../core/error/failure.dart';

abstract class PlayerRepository {
  Future<Either<Failure, Players>> getPlayerListByName(String name);
}
