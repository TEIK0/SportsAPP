import 'package:flutter/material.dart';

class SportsAppbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const SportsAppbar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Leagues',
          style: TextStyle(
              color: Color.fromARGB(255, 250, 246, 246), fontSize: 40),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
