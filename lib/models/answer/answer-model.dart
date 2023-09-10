import 'package:json_annotation/json_annotation.dart';
part 'answer-model.g.dart';

@JsonSerializable()
class AnswerModel {
  final String text;
  final int questionId;
  final int points;

  AnswerModel(
      {required this.text, required this.questionId, required this.points});

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}
