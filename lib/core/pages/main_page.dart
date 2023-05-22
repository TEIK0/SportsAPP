import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/players/presentation/pages/player_bloc_page.dart';
import '../../features/scores/presentation/pages/scrores_bloc_page.dart';
import '../../features/teams/presentation/pages/teams_bloc_page.dart';
import '../providers/ui_provider.dart';
import '../widgets/botttom_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _HomePageBody()),
      bottomNavigationBar: BottomBar(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentI = uiProvider.selectedMenuOp;

    switch (currentI) {
      case 0:
        return PlayersBlocPage();
      case 1:
        return ScoresBlocPage();
      case 2:
        return TeamsBlocPage();
      default:
        return ScoresBlocPage();
    }
  }
}
