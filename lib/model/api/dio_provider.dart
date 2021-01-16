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
  Future onRequest(RequestOptions options) async {
    log("onRequest: ${options.uri}\n"
        "data=${options.data}\n"
        "method=${options.method}\n"
        "headers=${options.headers}\n"
        "queryParameters=${options.queryParameters}");
    return options;
  }

  @override
  Future onResponse(Response response) {
    log("onResponse: $response");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    log("onError: $err\n"
        "Response: ${err.response}");
    return super.onError(err);
  }
}
