import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/screens/Home/home_screen.dart';
import 'package:telus_character_quiz/shared/routes.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';
import 'package:telus_character_quiz/state/quiz_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future main() async {
  runApp(const MyApp());
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(),
      child: ChangeNotifierProvider(
        create: (_) => QuizState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          initialRoute: '/',
          routes: appRoutes,
          home: const HomeScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
