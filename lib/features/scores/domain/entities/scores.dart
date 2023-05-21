import 'package:equatable/equatable.dart';

import 'package:sports_app/features/scores/data/models/scores_model.dart';

class Scores extends Equatable {
  final String id;
  final String sportKey;
  final String sportTitle;
  final DateTime commenceTime;
  final bool completed;
  final String homeTeam;
  final String awayTeam;
  final List<Score>? scores;
  final DateTime? lastUpdate;

  const Scores(
      {required this.id,
      required this.sportKey,
      required this.sportTitle,
      required this.commenceTime,
      required this.completed,
      required this.homeTeam,
      required this.awayTeam,
      this.scores,
      this.lastUpdate});

  @override
  List<Object?> get props => [id];
}
