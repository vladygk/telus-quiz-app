import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(context) {
    var state = Provider.of<AppState>(context, listen: false);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(green)),
                onPressed: () {
                  state.accessToken = null;
                  state.currentNavIndex = 0;
                  Navigator.of(context).pushReplacementNamed("/home");
                },
                child: const Text('Logout')),
          ),
        ],
      ),
    );
  }
}
