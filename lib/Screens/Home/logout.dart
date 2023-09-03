import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(context) {
    var state = Provider.of<AppState>(context, listen: false);

    return ElevatedButton(
        onPressed: () {
          state.accessToken = null;
          state.currentNavIndex = 0;
          Navigator.of(context).pushReplacementNamed("/home");
        },
        child: Text('Logout'));
  }
}
