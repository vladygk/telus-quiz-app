import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:telus_character_quiz/models/question/question-model.dart';
import 'package:telus_character_quiz/services/http_request.dart';

class QuizState extends ChangeNotifier {
  int questionIndex = 1;
  static const questionsCount = 2;
  QuestionModel? _question;

  QuestionModel? get Question => _question;

  set Question(QuestionModel? value) {
    _question = value;
  }

  dynamic getQuestionJsonData() async {
    if (questionIndex <= questionsCount) {
      var data = await Request('questions').Get(id: questionIndex);
      return parseToQuestionModel(json.decode(data));
    }
  }

  QuestionModel parseToQuestionModel(dynamic json) {
    return QuestionModel.fromJson(json);
  }
}
