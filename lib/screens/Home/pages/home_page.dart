import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/shared/bottom-modal.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';
import 'package:telus_character_quiz/state/quiz_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      var state = Provider.of<AppState>(context, listen: false);

      if (state.hasLogged) {
        state.hasLogged = false;
        BottomModal.showBottomModal(
            context: context,
            bg: green,
            title: 'Successfully logged in',
            subtitle: "Welcome back, ${state.accessToken?.split('@')[0] ?? ''}",
            icon: FontAwesomeIcons.check);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    var quizState = Provider.of<QuizState>(context);
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
                    quizState.questionIndex = 1;
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
