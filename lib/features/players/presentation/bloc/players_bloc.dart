import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sports_app/features/players/data/models/player_model.dart';
import 'package:sports_app/features/players/domain/repositories/player_repository.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/player.dart';

part 'players_event.dart';
part 'players_state.dart';

const String serverFailureMessage = 'Server failure';

class PlayersBloc extends Bloc<PlayersEvent, PlayersState> {
  final PlayerRepository remote;

  PlayersBloc({required this.remote}) : super(Empty()) {
    on<GetPlayersListEvent>((event, emit) async {
      emit(Loading());

      final failureOrPlayers = await remote.getPlayerListByName(event.name);

      _eitherLoadedOrError(failureOrPlayers);
    });
    on<ShowPlayerStatsEvent>((event, emit) async {
      emit(Loading());

      emit(LoadedPlayerStats(player: event.stats));
    });
  }

  void _eitherLoadedOrError(Either<Failure, Players> failureOrSports) async {
    emit(failureOrSports.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (players) => LoadedPlayersList(players: players)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
