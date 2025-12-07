import 'dart:convert';
import 'dart:io';
import 'package:bond/core/services/api/status_code.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'app_interceptors.dart';
import 'dio_logger.dart';
import '../network/error/api_error_handler.dart';
import 'package:bond/config/environment/environment_helper.dart' as env;

@LazySingleton()
class DioClient {
  final ApiErrorHandler apiErrorHandler;
  final Dio client;
  final AppInterceptors appInterceptors;

  DioClient({
    required this.client,
    required this.apiErrorHandler,
    required this.appInterceptors,
  }) {
    Duration timeOut = const Duration(seconds: 60);
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };
    client.options
      ..baseUrl = env.Environment.apiUrl
      ..responseType = ResponseType.plain
      ..connectTimeout = timeOut
      ..sendTimeout = timeOut
      ..receiveTimeout = timeOut
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    client.interceptors.add(appInterceptors);
    if (kDebugMode) {
      client.interceptors.add(DioLogInterceptor());
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: params,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == StatusCode.ok) {
        return json.decode(response.data);
      } else {
        return apiErrorHandler.handleDioErrorByStatusCode(
          response.statusCode ?? 500,
          jsonDecode(response.data.toString())['message'],
        );
      }
    } on DioException catch (error) {
      return apiErrorHandler.handleDioError(error);
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    bool isFromData = false,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: params,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == StatusCode.ok) {
        return json.decode(response.data);
      } else {
        return apiErrorHandler.handleDioErrorByStatusCode(
          response.statusCode ?? 500,
          jsonDecode(response.data.toString())['message'],
        );
      }
    } on DioException catch (error) {
      return apiErrorHandler.handleDioError(error);
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await client.get(
        path,
        queryParameters: params,
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == StatusCode.ok) {
        return json.decode(response.data);
      } else {
        return apiErrorHandler.handleDioErrorByStatusCode(
          response.statusCode ?? 500,
          jsonDecode(response.data.toString())['message'],
        );
      }
    } on DioException catch (error) {
      return apiErrorHandler.handleDioError(error);
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    bool isFromData = false,
  }) async {
    try {
      final response = await client.delete(
        path,
        queryParameters: params,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == StatusCode.ok) {
        return json.decode(response.data);
      } else {
        return apiErrorHandler.handleDioErrorByStatusCode(
          response.statusCode ?? 500,
          jsonDecode(response.data.toString())['message'],
        );
      }
    } on DioException catch (error) {
      return apiErrorHandler.handleDioError(error);
    } catch (error) {
      rethrow;
    }
  }
}
