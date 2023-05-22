import 'package:flutter/material.dart';

import 'package:sports_app/features/scores/domain/entities/scores.dart';

class ScoresWidget extends StatefulWidget {
  final Scores scores;

  const ScoresWidget({super.key, required this.scores});

  @override
  State<ScoresWidget> createState() => _ScoresWidgetState();
}

class _ScoresWidgetState extends State<ScoresWidget> {
  late Color home = Colors.white;

  late Color visit = Colors.white;

  @override
  Widget build(BuildContext context) {
    colorResult();
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 28, 28, 26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.scores.homeTeam,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: home),
                ),
              ),
              Expanded(
                child: Text(widget.scores.awayTeam,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: visit)),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          matchResult()
        ],
      ),
    );
  }

  Widget matchResult() {
    if (widget.scores.scores!.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(widget.scores.scores![0].score,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: home)),
          ),
          Expanded(
            child: Text(widget.scores.scores![1].score,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: visit)),
          )
        ],
      );
    } else {
      return Container(
          alignment: Alignment.center,
          child: const Text('Unsolved',
              style: TextStyle(fontSize: 30, color: Colors.white)));
    }
  }

  void colorResult() {
    if (widget.scores.scores!.isNotEmpty) {
      final homescore = int.parse(widget.scores.scores![0].score);
      final visitscore = int.parse(widget.scores.scores![1].score);
      if (homescore > visitscore) {
        home = const Color.fromARGB(255, 38, 244, 45);
        visit = const Color.fromARGB(255, 255, 52, 37);
      } else if (homescore < visitscore) {
        visit = const Color.fromARGB(255, 38, 244, 45);
        home = const Color.fromARGB(255, 255, 52, 37);
      } else {
        visit = Colors.white;
        home = Colors.white;
      }
    }
  }
}
