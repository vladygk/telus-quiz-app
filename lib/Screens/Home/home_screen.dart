import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';
import 'pages/about_page.dart';
import 'pages/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Widget> navPages = [
  HomePage(),
  AboutPage(),
  HomePage(),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

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
      body: navPages[state.currentNavIndex],
      bottomNavigationBar: const NavBar(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: green,
            width: 3,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: purple,
        currentIndex: state.currentNavIndex,
        onTap: (index) {
          state.currentNavIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house, color: green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.photoFilm, color: green),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bookAtlas, color: green),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
