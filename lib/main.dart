import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/Screens/Home/home_screen.dart';
import 'package:telus_character_quiz/Screens/Home/nav_state.dart';

import 'package:telus_character_quiz/shared/routes.dart';
import 'package:telus_character_quiz/shared/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: appRoutes,
        home: const BaseScreen(),
      ),
    );
  }
}
