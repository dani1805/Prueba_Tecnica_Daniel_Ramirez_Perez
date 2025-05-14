// ignore_for_file: lines_longer_than_80_chars

import 'package:dio/dio.dart';

class DioHelper {
  static Dio build(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (value) => value! < 600,
    );

    final dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
