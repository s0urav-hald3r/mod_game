import 'dart:async';
import 'package:dio/dio.dart';

import '../../utils/constants/endpoints.dart';
import '../interceptors/authorization_interceptor.dart';
import '../interceptors/logger_interceptor.dart';

class DioClient {
  late final Dio _dio;
  DioClient()
      : _dio = Dio(
          BaseOptions(
              baseUrl: XEndpoint.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              contentType: Headers.multipartFormDataContentType,
              responseType: ResponseType.json),
        )..interceptors
            .addAll([AuthorizationInterceptor(), LoggerInterceptor()]);

  // GET METHOD
  Future<Response> get(String url) async {
    try {
      final Response response = await _dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response> post(String url, {dynamic body}) async {
    try {
      final Response response = await _dio.post(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response> put(String url, {dynamic body}) async {
    try {
      final Response response = await _dio.put(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<Response> delete(String url, {dynamic body}) async {
    try {
      final Response response = await _dio.delete(url, data: body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
