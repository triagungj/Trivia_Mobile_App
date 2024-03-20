import 'package:json_annotation/json_annotation.dart';

part 'trivia_category_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TriviaCategoryModel {
  TriviaCategoryModel({
    required this.triviaCategories,
  });

  factory TriviaCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TriviaCategoryModelFromJson(json);
  final List<TriviaCategoryDataModel> triviaCategories;
}

@JsonSerializable(createToJson: false)
class TriviaCategoryDataModel {
  TriviaCategoryDataModel({
    required this.id,
    required this.name,
  });

  factory TriviaCategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$TriviaCategoryDataModelFromJson(json);
  final int id;
  final String name;
}
