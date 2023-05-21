part of 'players_bloc.dart';

abstract class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

class Empty extends PlayersState {}

class Loading extends PlayersState {}

class LoadedPlayersList extends PlayersState {
  final Players players;

  const LoadedPlayersList({required this.players});

  @override
  List<Object> get props => super.props..addAll([players]);
}

class LoadedPlayerStats extends PlayersState {
  final Datum player;

  const LoadedPlayerStats({required this.player});

  @override
  List<Object> get props => super.props..addAll([player]);
}

class Error extends PlayersState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
