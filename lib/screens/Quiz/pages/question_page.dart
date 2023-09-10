import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/models/answer/answer-model.dart';
import 'package:telus_character_quiz/screens/Quiz/pages/answer.dart';
import 'package:telus_character_quiz/shared/theme.dart';
import 'package:telus_character_quiz/state/quiz_state.dart';

class QuestionPage extends StatelessWidget {
  int index;
  QuestionPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quizState = Provider.of<QuizState>(context);

    return FutureBuilder(future: () async {
      var data = await quizState.getQuestionJsonData();
      quizState.Question = data;
    }(), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        EasyLoading.show(status: 'Configuring alpha paramater...');
      } else {
        EasyLoading.dismiss();
      }

      return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Text(
              quizState.Question?.text ?? "No data",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35),
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
            children: (quizState.Question?.answers ??
                    [
                      AnswerModel(text: 'Loading', questionId: -1, points: 0),
                      AnswerModel(text: 'Loading', questionId: -1, points: 0),
                      AnswerModel(text: 'Loading', questionId: -1, points: 0)
                    ])
                .asMap()
                .entries
                .map((kvp) => Answer(
                      index: kvp.key,
                      model: kvp.value,
                    ))
                .toList(),
          )
        ]),
      );
    });
  }
}
