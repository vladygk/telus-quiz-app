import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Center(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: green),
          height: 150,
          width: 270,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                child: Text(
                  'Welcome to the Telus quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                state.accessToken?.split('@')[0] ?? "",
                style: const TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: ElevatedButton(
                  child: const Text(
                    'Start  quiz!',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    state.currentQuizProgress = 0;
                    Navigator.pushNamed(context, '/quiz');
                  },
                ),
              )
            ],
          ),
        ),
      ),
      //bottomNavigationBar:
    );
  }
}
