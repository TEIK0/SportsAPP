import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecases.dart';

import 'package:sports_app/features/scores/domain/repositories/scores_repository.dart';
import 'package:sports_app/features/scores/domain/entities/sport.dart';

class GetSportsList implements UseCase<List<Sport>, NoParams> {
  final ScoresRepository repository;

  GetSportsList(this.repository);

  @override
  Future<Either<Failure, List<Sport>>> call(NoParams noParams) async {
    return await repository.getSportsList();
  }
}
