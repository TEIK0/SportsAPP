import 'package:dartz/dartz.dart';
import 'package:sports_app/features/players/data/datasources/player_remote_data_source.dart';
import 'package:sports_app/features/players/domain/entities/player.dart';
import 'package:sports_app/features/players/domain/repositories/player_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayersRemoteDataSourceImpl remote;

  final NetworkInfo network;

  PlayerRepositoryImpl({required this.remote, required this.network});

  @override
  Future<Either<Failure, Players>> getPlayerListByName(String key) async {
    if (await network.isConnected) {
      final remoteResult = await remote.getPlayersByName(key);
      return Right(remoteResult);
    }
    return Left(ServerFailure());
  }
}
