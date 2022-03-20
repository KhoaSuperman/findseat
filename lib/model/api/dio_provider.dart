import 'dart:developer';

import 'package:dio/dio.dart';

class DioProvider {
  static Dio instance() {
    final dio = Dio();

//    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(HttpLogInterceptor());

    return dio;
  }
}

class HttpLogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("onRequest: ${options.uri}\n"
        "data=${options.data}\n"
        "method=${options.method}\n"
        "headers=${options.headers}\n"
        "queryParameters=${options.queryParameters}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("statusCode=${response.statusCode}\n"
        "responseBody=${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("onError: $err\n"
        "Response: ${err.response}");
    super.onError(err, handler);
  }
}
