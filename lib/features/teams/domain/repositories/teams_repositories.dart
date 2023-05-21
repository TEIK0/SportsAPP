import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import 'package:sports_app/features/teams/domain/entities/teams.dart';

abstract class TeamsRepository {
  Future<Either<Failure, Teams>> getTeamsListByName(String name);
}
