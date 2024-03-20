// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trivia_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TriviaCategoryModel _$TriviaCategoryModelFromJson(Map<String, dynamic> json) =>
    TriviaCategoryModel(
      triviaCategories: (json['trivia_categories'] as List<dynamic>)
          .map(
            (e) => TriviaCategoryDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

TriviaCategoryDataModel _$TriviaCategoryDataModelFromJson(
  Map<String, dynamic> json,
) =>
    TriviaCategoryDataModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
