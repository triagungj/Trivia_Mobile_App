import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/core/network/api_error_response.dart';
import 'package:trivia_mobile/app/core/network/api_service.dart';
import 'package:trivia_mobile/app/data/body/trivia_form_body.dart';
import 'package:trivia_mobile/app/data/model/trivia_category_model.dart';
import 'package:trivia_mobile/app/data/model/trivia_form_model.dart';

class MainRepository {
  final _apiService = Get.find<ApiService>();

  Future<TriviaCategoryModel> getCategoryData() async {
    try {
      final response = await _apiService.dio.get<dynamic>(
        '/api_category.php',
      );

      return TriviaCategoryModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final errorMsg = ApiErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>,
        ).message;
        throw Exception(errorMsg);
      } else {
        throw Exception('Something wrong');
      }
    }
  }

  Future<TriviaFormModel> getTriviaFormData(TriviaFormBody body) async {
    try {
      final response = await _apiService.dio.get<dynamic>(
        '/api.php',
        queryParameters: body.toJson(),
      );

      return TriviaFormModel.fromJson(
        response.data as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      if (e.response != null) {
        final errorMsg = ApiErrorResponse.fromJson(
          e.response?.data as Map<String, dynamic>,
        ).message;
        throw Exception(errorMsg);
      } else {
        throw Exception('Something wrong');
      }
    }
  }
}
