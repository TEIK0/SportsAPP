import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/scores_repository.dart';

import 'package:sports_app/features/scores/domain/entities/scores.dart';
import 'package:sports_app/features/scores/domain/entities/sport.dart';

part 'scores_event.dart';
part 'scores_state.dart';

const String serverFailureMessage = 'Server failure';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  final ScoresRepository remote;

  ScoresBloc({required this.remote}) : super(Empty()) {
    on<GetSportsListEvent>((event, emit) async {
      emit(Loading());
      final failureOrSports = await remote.getSportsList();
      _eitherLoadedOrErrorSportState(failureOrSports);
    });
    on<GetScoresListEvent>((event, emit) async {
      emit(Loading());
      final failureOrScores = await remote.getScoresBySportKey(event.sportKey);
      _eitherLoadedOrErrorScoresState(failureOrScores);
    });
  }

  void _eitherLoadedOrErrorSportState(
      Either<Failure, List<Sport>> failureOrSports) async {
    emit(failureOrSports.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (sports) => LoadedSports(sports: sports)));
  }

  void _eitherLoadedOrErrorScoresState(
      Either<Failure, List<Scores>> failureOrSports) async {
    print('reach');
    emit(failureOrSports.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (scores) => LoadedScores(scores: scores)));
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
