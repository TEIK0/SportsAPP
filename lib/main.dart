import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/pages/main_page.dart';
import 'core/providers/ui_provider.dart';

import 'features/players/presentation/pages/player_bloc_page.dart';

import 'package:sports_app/features/scores/presentation/pages/scrores_bloc_page.dart';

import 'injections.dart' as injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sports App',
          initialRoute: 'home',
          routes: {
            'home': (_) => HomePage(),
            'scores': (_) => ScoresBlocPage(),
            'players': (_) => PlayersBlocPage(),
          },
          theme: ThemeData(
              appBarTheme:
                  const AppBarTheme(color: Color.fromARGB(255, 199, 43, 43)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromARGB(255, 199, 43, 43),
                unselectedItemColor: Color.fromARGB(255, 250, 246, 246),
                selectedItemColor: Color.fromARGB(255, 0, 0, 0),
              ))),
    );
  }
}
