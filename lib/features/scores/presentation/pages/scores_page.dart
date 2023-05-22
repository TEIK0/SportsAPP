import 'package:flutter/material.dart';

import 'package:sports_app/features/scores/presentation/pages/scrores_bloc_page.dart';
import '../../domain/entities/scores.dart';
import '../widgets/scores_widget.dart';

class ScoresPage extends StatelessWidget {
  final List<Scores> scores;

  const ScoresPage({required this.scores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: ListView.builder(
            itemCount: scores.length,
            itemBuilder: (context, index) {
              return ScoresWidget(
                scores: scores[index],
              );
            }));
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
