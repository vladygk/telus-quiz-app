import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/models/answer/answer-model.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/app_state.dart';
import 'package:telus_character_quiz/state/quiz_state.dart';

class Answer extends StatelessWidget {
  final int index;
  final AnswerModel model;

  const Answer({Key? key, required this.index, required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    var quizState = Provider.of<QuizState>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: green, borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 15,
        child: ElevatedButton.icon(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set your desired border radius
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(green)),
            onPressed: () {
              state.currentAnswerIndex = index;
              quizState.questionIndex++;
              state.nextPage();
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(state.currentAnswerIndex == index
                  ? FontAwesomeIcons.circleCheck
                  : FontAwesomeIcons.circle),
            ),
            label: Text(
              model.text,
              softWrap: true,
              style: const TextStyle(
                fontSize: 18,
              ),
            )),
      ),
    );
  }
}
