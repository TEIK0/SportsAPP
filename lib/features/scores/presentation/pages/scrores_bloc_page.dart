import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sports_app/features/scores/presentation/bloc/scores_bloc.dart';
import 'package:sports_app/features/scores/presentation/pages/scores_page.dart';
import 'package:sports_app/features/scores/presentation/pages/sports_page.dart';

import '../../../../injections.dart';

class ScoresBlocPage extends StatefulWidget {
  @override
  State<ScoresBlocPage> createState() => _ScoresBlocPageState();
}

class _ScoresBlocPageState extends State<ScoresBlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scoresBlocPageState(),
    );
  }

  BlocProvider<ScoresBloc> scoresBlocPageState() {
    return BlocProvider(
      create: (_) => sl<ScoresBloc>(),
      child: BlocBuilder<ScoresBloc, ScoresState>(
        builder: (context, state) {
          if (state is Empty) {
            getSportList(context);
          } else if (state is Error) {
            return const Center(child: Text('error'));
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedSports) {
            return SportsPage(
              state: state.sports,
            );
          } else if (state is LoadedScores) {
            return ScoresPage(scores: state.scores);
          } else {
            return const Text('Fatal error');
          }
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}

void getSportList(BuildContext context) {
  BlocProvider.of<ScoresBloc>(context).add(const GetSportsListEvent());
}

void getScoresList(BuildContext context, String sportKey) {
  BlocProvider.of<ScoresBloc>(context).add(GetScoresListEvent(sportKey));
}
