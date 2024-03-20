// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TriviaFormModel _$TriviaFormModelFromJson(Map<String, dynamic> json) =>
    TriviaFormModel(
      responseCode: json['response_code'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => TriviaFormDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TriviaFormDataModel _$TriviaFormDataModelFromJson(Map<String, dynamic> json) =>
    TriviaFormDataModel(
      type: json['type'] as String,
      difficulty: json['difficulty'] as String,
      category: json['category'] as String,
      question: json['question'] as String,
      correctAnswer: json['correct_answer'] as String,
      incorrectAnswers: (json['incorrect_answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
