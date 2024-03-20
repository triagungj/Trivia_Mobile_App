import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = Get.find<SessionService>().getToken();
    // if (token != null) {
    //   options.headers = {
    //     HttpHeaders.authorizationHeader: 'Bearer $token',
    //   };
    // }
    super.onRequest(options, handler);
  }
}
