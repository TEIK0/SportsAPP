import 'package:flutter/material.dart';
import 'package:sports_app/features/scores/domain/entities/scores.dart';

class ScoresWidget extends StatelessWidget {
  final Scores scores;
  const ScoresWidget({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Row();
  }

  /* return Text(
       textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 21, 21, 21)));
  */
}
