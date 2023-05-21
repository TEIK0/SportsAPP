part of 'scores_bloc.dart';

abstract class ScoresEvent extends Equatable {
  const ScoresEvent();

  @override
  List<Object> get props => [];
}

class GetSportsListEvent extends ScoresEvent {
  const GetSportsListEvent();

  @override
  List<Object> get props => [];
}

class GetScoresListEvent extends ScoresEvent {
  final String sportKey;

  const GetScoresListEvent(this.sportKey);

  @override
  List<Object> get props => [sportKey];
}
