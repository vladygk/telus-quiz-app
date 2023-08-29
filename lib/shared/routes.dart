import 'package:flutter/material.dart';
import 'package:telus_character_quiz/Screens/About/about_screen.dart';
import 'package:telus_character_quiz/Screens/Home/home_screen.dart';

final Map<String, StatelessWidget Function(dynamic)> appRoutes = {
  // '/': (context) => const HomeScreen(),
  //'/about': (context) => const AboutScreen(),
  //'/profile': (context) => const ProfileScreen(),
  //'/login': (context) => const LoginScreen(),
  //'/topics': (context) => const TopicsScreen(),
};

final List<Widget> navPages = [
  HomeScreen(),
  AboutScreen(),
  HomeScreen(),
];
