import 'package:json_annotation/json_annotation.dart';
import 'package:telus_character_quiz/models/answer/answer-model.dart';

part 'question-model.g.dart';

@JsonSerializable()
class QuestionModel {
  final String text;
  final List<AnswerModel> answers;

  QuestionModel({required this.text, required this.answers});

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelToJson(this);
}
