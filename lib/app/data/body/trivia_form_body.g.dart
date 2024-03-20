// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_form_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TriviaFormBodyToJson(TriviaFormBody instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'category': instance.category,
      'type': _$QuestionTypeEnumEnumMap[instance.type],
      'difficulty': _$DifficultyEnumEnumMap[instance.difficulty],
    };

const _$QuestionTypeEnumEnumMap = {
  QuestionTypeEnum.MULTIPLE_CHOICE: 'multiple',
  QuestionTypeEnum.BOOLEAN: 'boolean',
};

const _$DifficultyEnumEnumMap = {
  DifficultyEnum.EASY: 'easy',
  DifficultyEnum.MEDIUM: 'medium',
  DifficultyEnum.HARD: 'hard',
};
