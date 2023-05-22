import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/ui_provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOp = i,
        currentIndex: uiProvider.selectedMenuOp,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.boy_rounded), label: 'Players'),
          BottomNavigationBarItem(icon: Icon(Icons.numbers), label: 'Scores'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Teams'),
        ]);
  }
}
