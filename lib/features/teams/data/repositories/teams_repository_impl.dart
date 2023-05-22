import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';

import '../datasources/teams_remote_data_source.dart';
import 'package:sports_app/features/teams/domain/entities/teams.dart';
import 'package:sports_app/features/teams/domain/repositories/teams_repositories.dart';

class TeamsRepositoryImpl implements TeamsRepository {
  final TeamsRemoteDataSourceImpl remote;

  final NetworkInfo network;

  TeamsRepositoryImpl({required this.remote, required this.network});

  @override
  Future<Either<Failure, Teams>> getTeamsListByName(String key) async {
    if (await network.isConnected) {
      print('going to ask remote');
      final remoteResult = await remote.getTeamsListByName(key);
      print(remoteResult.runtimeType);
      return Right(remoteResult);
    }
    return Left(ServerFailure());
  }
}
