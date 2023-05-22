import 'package:flutter/material.dart';

import '../../data/models/player_model.dart';

class PlayerStatsPage extends StatelessWidget {
  final Datum state;

  const PlayerStatsPage({super.key, required this.state});

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
        imageContainer(),
        const SizedBox(height: 20),
        statContainer('Shirt Number', shirtNumber),
        const SizedBox(height: 20),
        statContainer('Position', position),
        const SizedBox(height: 20),
        statContainer('Age', age),
        const SizedBox(height: 20),
        statContainer('Date Of Birth', birth),
        const SizedBox(height: 20),
        statContainer('Height', height),
        const SizedBox(height: 20),
      ]),
    ));
  }

  Text statContainer(String stat, function) {
    return Text('$stat: ${function()}',
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white));
  }

  Text nameContainer() {
    return Text(state.name,
        style: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white));
  }

  Container imageContainer() {
    // ignore: sized_box_for_whitespace
    return Container(
        height: 200,
        width: 200,
        child: state.hasPhoto
            ? Image.network(state.photo, fit: BoxFit.cover)
            : Image.asset('assets/no_player_picture.png', fit: BoxFit.cover));
  }

  String position() {
    if (state.positionName != null) {
      return state.positionName!;
    } else {
      return 'No position Avaliable';
    }
  }

  String age() {
    if (state.positionName != null) {
      return '${state.age}';
    } else {
      return 'No age Avaliable';
    }
  }

  String birth() {
    if (state.positionName != null) {
      return state.dateBirthAt;
    } else {
      return 'No date birth Avaliable';
    }
  }

  String height() {
    if (state.positionName != null) {
      return '${state.height}';
    } else {
      return 'No height Avaliable';
    }
  }

  String shirtNumber() {
    if (state.positionName != null) {
      return '${state.shirtNumber}';
    } else {
      return 'No shirt number Avaliable';
    }
  }
}
