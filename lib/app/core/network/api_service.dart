import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trivia_mobile/app/core/constant/value_const.dart';
import 'package:trivia_mobile/app/core/network/interceptors/auth_interceptor.dart';
import 'package:trivia_mobile/app/core/network/interceptors/loging_interceptor.dart';

class ApiService extends GetxService {
  ApiService() {
    _getDio();
  }
  Dio get dio => _getDio();

  Dio _getDio() {
    final header = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final options = BaseOptions(
      baseUrl: ValueConst.apiBaseUrl,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      receiveDataWhenStatusError: true,
      headers: header,
    );

    final dio = Dio(options);

    dio.interceptors.addAll([
      LoggingInterceptor(),
      AuthInterceptor(),
    ]);

    return dio;
  }
}
