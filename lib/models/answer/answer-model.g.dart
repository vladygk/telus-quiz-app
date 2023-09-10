// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
      text: json['text'] as String,
      questionId: json['questionId'] as int,
      points: json['points'] as int,
    );

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'text': instance.text,
      'questionId': instance.questionId,
      'points': instance.points,
    };
