part of 'teams_bloc.dart';

abstract class TeamsState extends Equatable {
  const TeamsState();

  @override
  List<Object> get props => [];
}

class Empty extends TeamsState {}

class Loading extends TeamsState {}

class LoadedTeamsList extends TeamsState {
  final Teams teams;

  const LoadedTeamsList({required this.teams});

  @override
  List<Object> get props => super.props..addAll([teams]);
}

class LoadedTeamInfo extends TeamsState {
  final DatumTeams team;

  const LoadedTeamInfo({required this.team});

  @override
  List<Object> get props => super.props..addAll([team]);
}

class Error extends TeamsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
