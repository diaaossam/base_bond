import 'package:bond/core/services/api/dio_client.dart';
import 'package:injectable/injectable.dart';

import 'dio_request_builder.dart';

@LazySingleton()
class DioConsumer {
  final DioClient _client;

  DioConsumer({required DioClient client}) : _client = client;

  // Builder Creator
  DioRequestBuilder<T> request<T>() => DioRequestBuilder<T>(this);

  // Fluent wrappers
  DioRequestBuilder<T> get<T>(String path) =>
      request<T>().method("GET").path(path);

  DioRequestBuilder<T> post<T>(String path, {dynamic data}) =>
      request<T>().method("POST").path(path).body(data);

  DioRequestBuilder<T> put<T>(String path, {dynamic data}) =>
      request<T>().method("PUT").path(path).body(data);

  DioRequestBuilder<T> deleteRequest<T>(String path, {dynamic data}) =>
      request<T>().method("DELETE").path(path).body(data);

  Future<dynamic> performRequest({
    required String path,
    required String method,
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    switch (method) {
      case "GET":
        return await _client.get(path: path, params: params, headers: headers);
      case "POST":
        return await _client.post(path: path, params: params, data: data);
      case "PUT":
        return await _client.put(path: path, params: params, data: data);
      case "DELETE":
        return await _client.delete(path: path, params: params, data: data);
      default:
        throw Exception("Unsupported method");
    }
  }
}
