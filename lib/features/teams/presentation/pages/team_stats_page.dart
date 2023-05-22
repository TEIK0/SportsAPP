import 'package:flutter/material.dart';

import '../../data/models/teams_model.dart';

class TeamStatsPage extends StatelessWidget {
  final DatumTeams state;

  const TeamStatsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return pageBuilder();
  }

  SingleChildScrollView pageBuilder() {
    return SingleChildScrollView(
        child: Center(
      child: Column(children: [
        const SizedBox(height: 50),
        nameContainer(),
        const SizedBox(height: 50),
        logoContainer(),
        const SizedBox(height: 20),
        statContainer('Sport', sport),
        const SizedBox(height: 20),
        statContainer('Country', country),
      ]),
    ));
  }

  Text statContainer(String stat, function) {
    return Text('$stat: ${function()}',
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white));
  }

  Padding nameContainer() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(state.name,
          style: const TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center),
    );
  }

  Container logoContainer() {
    // ignore: sized_box_for_whitespace
    return Container(
        height: 200,
        width: 200,
        child: state.hasLogo
            ? Image.network(state.logo, fit: BoxFit.cover)
            : Image.asset('assets/no_player_picture.png', fit: BoxFit.cover));
  }

  String country() {
    if (state.country != null) {
      return state.country!;
    } else {
      return 'No Country Avaliable';
    }
  }

  String sport() {
    if (state.sportId == 1) {
      return 'Fotball';
    } else if (state.sportId == 2) {
      return 'Tennis';
    } else if (state.sportId == 3) {
      return 'Basketball';
    } else if (state.sportId == 4) {
      return 'Hockey';
    } else if (state.sportId == 5) {
      return 'Voleyball';
    } else if (state.sportId == 6) {
      return 'Handball';
    } else {
      return 'Sport unvaliable';
    }
  }
}
