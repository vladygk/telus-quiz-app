import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class NavBarGuest extends StatelessWidget {
  const NavBarGuest({super.key});

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
            icon: Icon(FontAwesomeIcons.rightToBracket, color: green),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userPlus, color: green),
            label: 'Register',
          ),
        ],
      ),
    );
  }
}
