import 'package:flutter/material.dart';

class SportsAppbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  const SportsAppbar({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Leagues',
          style: TextStyle(color: Colors.black, fontSize: 40),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
