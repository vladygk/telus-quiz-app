import 'package:flutter/material.dart';
import 'package:telus_character_quiz/screens/Quiz/pages/answer.dart';
import 'package:telus_character_quiz/shared/theme.dart';

class QuestionPage extends StatelessWidget {
  int index;
  QuestionPage({Key? key, required this.index}) : super(key: key);
  List<int> dummyList = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Text(
            "1. Do you like Malden Dimitrov?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35),
            softWrap: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Divider(
            thickness: 5,
            color: green,
          ),
        ),
        Column(
          children: dummyList.map((index) => Answer(index: index)).toList(),
        )
      ]),
    );
  }
}
