import 'package:json_annotation/json_annotation.dart';

enum DifficultyEnum {
  @JsonValue('easy')
  EASY,
  @JsonValue('medium')
  MEDIUM,
  @JsonValue('hard')
  HARD,
}
