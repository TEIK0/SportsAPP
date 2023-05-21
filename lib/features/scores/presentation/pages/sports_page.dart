import 'package:flutter/material.dart';

import '../widgets/sports_app_bar.dart';

import 'package:sports_app/features/scores/domain/entities/sport.dart';
import 'package:sports_app/features/scores/presentation/widgets/sports_list_view.dart';

class SportsPage extends StatelessWidget {
  final List<Sport> state;

  const SportsPage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SportsAppbar(context: context),
      body: SportsListViewWidget(state: state, context: context),
    );
  }
}
