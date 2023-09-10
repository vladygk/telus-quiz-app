import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/screens/Quiz/pages/congrats_page.dart';
import 'package:telus_character_quiz/screens/Quiz/pages/question_page.dart';
import 'package:telus_character_quiz/shared/progress_bar.dart';
import 'package:telus_character_quiz/state/app_state.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(
        title: AnimatedProgressbar(value: state.currentQuizProgress),
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.xmark),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 3,
          controller: state.controller,
          itemBuilder: (BuildContext context, int index) {
            print('indeeeeex: $index');
            if (index >= 2) {
              EasyLoading.dismiss();
              return const CongratsPage();
            }

            return QuestionPage(index: index);
          }),
    );
  }
}
