import 'package:flutter/material.dart';
import 'package:telus_character_quiz/Screens/Home/home_screen.dart';
import 'package:telus_character_quiz/screens/Quiz/quiz_screen.dart';
import 'package:telus_character_quiz/screens/Result/result_screen.dart';

final Map<String, StatelessWidget Function(dynamic)> appRoutes = {
  '/home': (context) => const HomeScreen(),
  '/quiz': (context) => const QuizScreen(),
  '/result': (context) => const ResultScreen(),
};
