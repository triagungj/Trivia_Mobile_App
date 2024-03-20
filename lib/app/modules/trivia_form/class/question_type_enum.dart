import 'package:json_annotation/json_annotation.dart';

enum QuestionTypeEnum {
  @JsonValue('multiple')
  MULTIPLE_CHOICE,
  @JsonValue('boolean')
  BOOLEAN,
}
