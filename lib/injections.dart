//Import Development Packages
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

//Import Core Feature
import 'package:sports_app/core/network/network_info.dart';
import 'core/providers/ui_provider.dart';

//Import Scores Feature
import 'package:sports_app/features/scores/data/datasources/scores_remote_data_source.dart';
import 'package:sports_app/features/scores/data/repositories/scores_repository_impl.dart';
import 'package:sports_app/features/scores/domain/repositories/scores_repository.dart';
import 'package:sports_app/features/scores/domain/usecases/get_scores_by_sport_key.dart';
import 'package:sports_app/features/scores/domain/usecases/get_sports_list.dart';
import 'package:sports_app/features/scores/presentation/bloc/scores_bloc.dart';

//Import Teams Feature
import 'package:sports_app/features/teams/data/datasources/teams_remote_data_source.dart';
import 'package:sports_app/features/teams/data/repositories/teams_repository_impl.dart';
import 'package:sports_app/features/teams/domain/repositories/teams_repositories.dart';
import 'package:sports_app/features/teams/domain/usecases/get_teams_list_by_name.dart';
import 'features/teams/presentation/bloc/teams_bloc.dart';

//Import Players Feature
import 'features/players/data/datasources/player_remote_data_source.dart';
import 'features/players/data/repositories/player_repository_impl.dart';
import 'features/players/domain/repositories/player_repository.dart';
import 'features/players/domain/usecases/get_player_list_by_name.dart';
import 'features/players/presentation/bloc/players_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //Register Blocs
  sl.registerFactory(() => ScoresBloc(remote: sl()));
  sl.registerFactory(() => PlayersBloc(remote: sl()));
  sl.registerFactory(() => TeamsBloc(remote: sl()));

  //Register Scores Feature complements
  sl.registerLazySingleton(() => GetSportsList(sl()));
  sl.registerLazySingleton(() => GetScoresBySport(sl()));
  sl.registerLazySingleton<ScoresRepository>(
      () => ScoresRepositoryImpl(network: sl(), remote: sl()));
  sl.registerLazySingleton<ScoresRemoteDataSource>(
      () => ScoresRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(() => ScoresRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(
      () => ScoresRepositoryImpl(network: sl(), remote: sl()));

  //Register Players Feature complements
  sl.registerLazySingleton(() => GetPlayerListByName(sl()));
  sl.registerLazySingleton<PlayerRepository>(
      () => PlayerRepositoryImpl(network: sl(), remote: sl()));
  sl.registerLazySingleton<PlayersRemoteDataSource>(
      () => PlayersRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(() => PlayersRemoteDataSourceImpl(client: sl()));

  //Register Teams Feature complements
  sl.registerLazySingleton(() => GetTeamsListByName(sl()));
  sl.registerLazySingleton<TeamsRepository>(
      () => TeamsRepositoryImpl(network: sl(), remote: sl()));
  sl.registerLazySingleton<TeamsRemoteDataSource>(
      () => TeamsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton(() => TeamsRemoteDataSourceImpl(client: sl()));

  //Register Core complements
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => UiProvider());
}
