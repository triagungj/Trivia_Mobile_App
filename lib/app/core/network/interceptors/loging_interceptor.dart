import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Log Options
    log("--> ${options.method} ${"${options.baseUrl}${options.path}"}");
    log('Headers:');
    options.headers.forEach((k, dynamic v) => log('$k: $v'));
    log('queryParameters:');
    options.queryParameters.forEach((k, dynamic v) => log('$k: $v'));
    log(
      '--> END ${options.method}',
    );

    /// Log Headers and Request Body
    log(
      '\n'
      '-- headers --\n'
      '${options.headers} \n'
      '-- request -- \n -->body '
      '${options.data} \n',
    );
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// Log Error Response
    log(
      '\n'
      'Error Response : ${err.response?.requestOptions.uri} \n'
      'Status Code: ${err.response?.statusCode}\n'
      '-- headers --\n'
      '${err.response?.headers} \n'
      '-- error response --\n'
      '${jsonEncode(err.response?.data)} \n',
    );
    super.onError(err, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    /// Log Success Response
    log(
      '\n'
      'Response : ${response.requestOptions.uri} \n'
      '-- headers --\n'
      '${response.headers} \n'
      '-- response --\n'
      '${jsonEncode(response.data)} \n',
    );
    super.onResponse(response, handler);
  }
}
