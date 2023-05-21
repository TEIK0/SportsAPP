import 'package:dartz/dartz.dart';

import 'package:sports_app/core/error/failure.dart';
import '../../../../core/network/network_info.dart';

import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart';
import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/domain/entities/scores.dart';
import 'package:sports_app/features/scores/domain/repositories/scores_repository.dart';

class ScoresRepositoryImpl implements ScoresRepository {
  final ScoresRemoteDataSourceImpl remote;

  final NetworkInfo network;

  ScoresRepositoryImpl({required this.remote, required this.network});

  @override
  Future<Either<Failure, List<Scores>>> getScoresBySportKey(String key) async {
    if (await network.isConnected) {
      final remoteResult = await remote.getScoresBySportKey(key);
      return Right(remoteResult);
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<Sport>>> getSportsList() async {
    if (await network.isConnected) {
      final remoteResult = await remote.getSportList();
      return Right(remoteResult);
    }
    return Left(ServerFailure());
  }
}
