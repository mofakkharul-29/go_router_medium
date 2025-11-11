import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class DioConfiguration {
  static const String baseUrl =
      "https://69080829b49bea95fbf22bbe.mockapi.io";
  final String endpoint;
  final HttpMethod method;
  late final Dio _dio;

  DioConfiguration({
    required this.endpoint,
    required this.method,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        responseType: responseType,
      ),
    );
    initializeInterceptors();
  }

  Dio get dio => _dio;

  Map<String, dynamic> get headers => {
    Headers.acceptHeader: Headers.jsonContentType,
    Headers.contentTypeHeader: Headers.jsonContentType,
  };

  Map<String, dynamic>? get queryParameters => null;
  Object? get body;

  ResponseType get responseType => ResponseType.json;
  String get completeUrl => '$baseUrl/$endpoint';

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          debugPrint('❌Error: ${error.message}');
          handler.next(error);
        },
        onRequest: (options, handler) {
          debugPrint(
            "➡️ Request: ${options.method} ${options.uri}",
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint("✅ Response: ${response.data}");
          handler.next(response);
        },
      ),
    );
  }
}

enum HttpMethod { get, post, put, update, delete }
