import 'package:json_annotation/json_annotation.dart';

part 'trivia_form_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TriviaFormModel {
  TriviaFormModel({
    required this.responseCode,
    required this.results,
  });

  factory TriviaFormModel.fromJson(Map<String, dynamic> json) =>
      _$TriviaFormModelFromJson(json);

  final int responseCode;
  final List<TriviaFormDataModel> results;
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TriviaFormDataModel {
  TriviaFormDataModel({
    required this.type,
    required this.difficulty,
    required this.category,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory TriviaFormDataModel.fromJson(Map<String, dynamic> json) =>
      _$TriviaFormDataModelFromJson(json);

  final String type;
  final String difficulty;
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;
}
