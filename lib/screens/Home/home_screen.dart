import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/screens/Home/logout_page.dart';
import 'package:telus_character_quiz/screens/Home/nav-bars/authenticated_navbar.dart';
import 'package:telus_character_quiz/screens/Home/nav-bars/guest_navbar.dart';
import 'package:telus_character_quiz/screens/Home/pages/login_page.dart';
import 'package:telus_character_quiz/screens/Home/pages/register_page.dart';
import 'package:telus_character_quiz/state/app_state.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';

final List<Widget> navPagesAuthenticated = [
  const HomePage(),
  const HomePage(), // to be change dto gallery
  const AboutPage(),
  const LogoutPage(),
];

final List<Widget> navPagesGuest = [
  const LoginPage(),
  const RegisterPage(),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    bool isAuthenticated = !(state.accessToken == null);

    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: ImageIcon(
              AssetImage(
                'assets/logo.png',
              ),
            ),
          ),
          title: const Center(
              child: Text(
            'Telus personality quiz',
            style: TextStyle(fontSize: 21),
          ))),
      body: isAuthenticated
          ? navPagesAuthenticated[state.currentNavIndex]
          : navPagesGuest[state.currentNavIndex],
      bottomNavigationBar:
          isAuthenticated ? const NavBarAuthenticated() : const NavBarGuest(),
    );
  }
}
