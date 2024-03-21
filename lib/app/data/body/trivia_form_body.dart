import 'package:json_annotation/json_annotation.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/difficulty_enum.dart';
import 'package:trivia_mobile/app/modules/trivia_form/class/question_type_enum.dart';

part 'trivia_form_body.g.dart';

@JsonSerializable(createFactory: false)
class TriviaFormBody {
  TriviaFormBody({
    required this.amount,
    required this.category,
    required this.difficulty,
    this.type,
  });

  final String amount;
  final int category;
  final QuestionTypeEnum? type;
  final DifficultyEnum difficulty;

  Map<String, dynamic> toJson() => _$TriviaFormBodyToJson(this);
}
