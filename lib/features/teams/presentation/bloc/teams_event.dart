part of 'teams_bloc.dart';

abstract class TeamsEvent extends Equatable {
  const TeamsEvent();

  @override
  List<Object> get props => [];
}

class GetTeamsListEvent extends TeamsEvent {
  final String name;

  const GetTeamsListEvent(this.name);

  @override
  List<Object> get props => [name];
}

class ShowTeamInfoEvent extends TeamsEvent {
  final Datum stats;

  const ShowTeamInfoEvent(this.stats);

  @override
  List<Object> get props => [stats];
}
