import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';

import 'package:sports_app/features/teams/domain/entities/teams.dart';
import '../repositories/teams_repositories.dart';

class GetTeamsListByName implements UseCase<Teams, String> {
  final TeamsRepository repository;

  GetTeamsListByName(this.repository);

  @override
  Future<Either<Failure, Teams>> call(String name) async {
    return await repository.getTeamsListByName(name);
  }
}
