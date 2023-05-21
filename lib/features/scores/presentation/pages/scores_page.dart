import 'package:flutter/material.dart';

import 'package:sports_app/features/scores/presentation/pages/scrores_bloc_page.dart';
import '../../domain/entities/scores.dart';

class ScoresPage extends StatelessWidget {
  final List<Scores> scores;

  const ScoresPage({required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: ListView.builder(
            itemCount: scores.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(width: 2)),
                child: ListTile(title: scoresShow(index), onTap: () => {}),
              );
            }));
  }

  Text scoresShow(int index) {
    print(scores[index].scores.runtimeType);
    if (scores[index].scores != null) {
      return Text(
          "\n${scores[index].scores?[0].name}\n vs \n${scores[index].scores?[1].name}\n\n ${scores[index].scores?[0].score} - ${scores[index].scores![1].score}\n",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 21, 21, 21)));
    } else {
      return Text(
          "\n${scores[index].homeTeam}\n vs \n${scores[index].awayTeam}\n\n No Scores Avaliable \n",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 21, 21, 21)));
    }
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: BackButton(onPressed: () => getSportList(context)),
        elevation: 0,
        title: const Text(
          'Scores',
          style: TextStyle(color: Colors.black, fontSize: 40),
        ));
  }
}
