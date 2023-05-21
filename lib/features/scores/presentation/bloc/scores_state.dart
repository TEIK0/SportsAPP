part of 'scores_bloc.dart';

abstract class ScoresState extends Equatable {
  const ScoresState();

  @override
  List<Object> get props => [];
}

class Empty extends ScoresState {}

class Loading extends ScoresState {}

class LoadedSports extends ScoresState {
  final List<Sport> sports;

  const LoadedSports({required this.sports});

  @override
  List<Object> get props => super.props..addAll([sports]);
}

class LoadedScores extends ScoresState {
  final List<Scores> scores;

  const LoadedScores({required this.scores});

  @override
  List<Object> get props => super.props..addAll([scores]);
}

class Error extends ScoresState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => super.props..addAll([message]);
}
