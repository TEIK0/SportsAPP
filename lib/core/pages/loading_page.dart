import 'package:flutter/material.dart';

class LoadingDisplay extends StatefulWidget {
  @override
  State<LoadingDisplay> createState() => _LoadingDisplay();
}

class _LoadingDisplay extends State<LoadingDisplay> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
