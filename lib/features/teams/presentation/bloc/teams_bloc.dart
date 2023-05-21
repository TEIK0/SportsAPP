import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/teams_model.dart';

import 'package:sports_app/features/teams/domain/entities/teams.dart';
import '../../domain/repositories/teams_repositories.dart';

part 'teams_event.dart';
part 'teams_state.dart';

const String serverFailureMessage = 'Server failure';

class TeamsBloc extends Bloc<TeamsEvent, TeamsState> {
  final TeamsRepository remote;

  TeamsBloc({required this.remote}) : super(Empty()) {
    on<GetTeamsListEvent>((event, emit) async {
      emit(Loading());

      final failureOrPlayers = await remote.getTeamsListByName(event.name);

      _eitherLoadedOrError(failureOrPlayers);
    });
    on<ShowTeamInfoEvent>((event, emit) async {
      emit(Loading());

      emit(LoadedTeamInfo(team: event.stats));
    });
  }

  void _eitherLoadedOrError(Either<Failure, Teams> failureOrSports) async {
    emit(failureOrSports.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (teams) => LoadedTeamsList(teams: teams)));
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
