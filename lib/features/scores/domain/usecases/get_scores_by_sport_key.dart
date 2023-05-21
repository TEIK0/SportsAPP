import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';

import 'package:sports_app/features/scores/domain/entities/scores.dart';
import 'package:sports_app/features/scores/domain/repositories/scores_repository.dart';

class GetScoresBySport implements UseCase<List<Scores>, String> {
  final ScoresRepository repository;

  GetScoresBySport(this.repository);

  @override
  Future<Either<Failure, List<Scores>>> call(String sportKey) async {
    return await repository.getScoresBySportKey(sportKey);
  }
}
