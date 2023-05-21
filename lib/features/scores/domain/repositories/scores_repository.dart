import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

import '../entities/scores.dart';
import '../entities/sport.dart';

abstract class ScoresRepository {
  Future<Either<Failure, List<Sport>>> getSportsList();
  Future<Either<Failure, List<Scores>>> getScoresBySportKey(String key);
}
