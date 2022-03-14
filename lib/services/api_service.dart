import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  late final Dio dio;

  ApiService() {
    _init();
  }

  void _init() {
    dio = Dio(_defaultOption());
  }

  BaseOptions _defaultOption() {
    var option = BaseOptions(
      baseUrl: "http://api.openweathermap.org/",
      connectTimeout: 1000 * 60,
      receiveTimeout: 1000 * 60,
      sendTimeout: 1000 * 60,
    );
    return option;
  }

  /// GET
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      Response response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: await _checkOptions('GET', options),
      );
      return response;
    } on DioError catch (error) {
      return Future.value(error.response);
    }
  }

  /// check options.
  Future<Options> _checkOptions(
    String method,
    Options? options,
  ) async {
    if (options == null) {
      Map<String, dynamic> headers = {};
      options = Options(
        method: method,
        headers: headers,
      );
    }

    return options;
  }
}
