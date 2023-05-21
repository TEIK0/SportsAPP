part of 'players_bloc.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}

class GetPlayersListEvent extends PlayersEvent {
  final String name;

  const GetPlayersListEvent(this.name);

  @override
  List<Object> get props => [name];
}

class ShowPlayerStatsEvent extends PlayersEvent {
  final Datum stats;

  const ShowPlayerStatsEvent(this.stats);

  @override
  List<Object> get props => [stats];
}
