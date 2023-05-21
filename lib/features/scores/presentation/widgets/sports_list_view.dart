import 'package:flutter/material.dart';

import '../../domain/entities/sport.dart';
import '../bloc/scores_bloc.dart';
import '../pages/scrores_bloc_page.dart';

class SportsListViewWidget extends StatelessWidget {
  final List<Sport> state;

  final BuildContext context;

  const SportsListViewWidget(
      {super.key, required this.state, required this.context});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.length,
      itemBuilder: (context, index) {
        if (state[index].active == true) {
          if (state[index].group == 'Baseball' ||
              state[index].group == 'Basketball' ||
              state[index].group == 'Soccer') {
            return sportsListBuild(index, context);
          } else {
            return const SizedBox(height: 0);
          }
        } else {
          return const SizedBox(height: 0);
        }
      },
    );
  }

  Container sportsListBuild(int index, BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
          border: Border(bottom: BorderSide(width: 3))),
      child: ListTile(
          minVerticalPadding: 15,
          leading: Image(
              image: sportIconLoader(state[index].group, context),
              fit: BoxFit.cover),
          title: Text(state[index].title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 1, 1))),
          onTap: () => {getScoresList(context, state[index].key)}),
    );
  }

  AssetImage sportIconLoader(String sport, BuildContext context) {
    if (sport == 'Baseball') {
      return const AssetImage('assets/baseball.png');
    } else if (sport == 'Basketball') {
      return const AssetImage('assets/basquetball.png');
    }
    return const AssetImage('assets/soccerball.png');
  }
}
