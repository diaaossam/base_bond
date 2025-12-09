import 'dart:async';

import 'dio_consumer.dart';
import 'dio_request_builder.dart';

/// A high-level fluent API around [DioConsumer] that matches the desired usage:
///
/// ```dart
/// final response = await BaseBondApiRequest<MyResponseModel>(
///   dioConsumer,
///   '/login',
///   method: 'POST',
/// )
///     .body({
///       'email': 'user@example.com',
///       'password': 'secret',
///     })
///     .header({'Accept-Language': 'en'})
///     .factory((json) => MyResponseModel.fromJson(json))
///     .execute();
/// ```
class BaseBondApiRequest<T> {
  final DioRequestBuilder<T> _builder;

  BaseBondApiRequest(DioConsumer dio, String path, {String method = 'GET'})
    : _builder = dio.request<T>().method(method).path(path);

  /// Add / override query parameters.
  BaseBondApiRequest<T> query(Map<String, dynamic>? params) {
    _builder.query(params);
    return this;
  }

  /// Set the request body (can be a Map, FormData, etc.).
  BaseBondApiRequest<T> body(dynamic body) {
    _builder.body(body);
    return this;
  }

  /// Explicit helper when you want to send `FormData`.
  BaseBondApiRequest<T> formData(dynamic formData) {
    _builder.formData(formData);
    return this;
  }

  /// Merge custom headers into the request.
  BaseBondApiRequest<T> header(Map<String, dynamic>? headers) {
    _builder.headers(headers);
    return this;
  }

  /// Configure the JSON-to-model converter.
  BaseBondApiRequest<T> factory(JsonParser<T> parser) {
    _builder.factory(parser);
    return this;
  }

  /// Cache the full JSON response by key, with optional TTL.
  BaseBondApiRequest<T> cache({required String key, Duration? ttl}) {
    _builder.cache(key: key, ttl: ttl);
    return this;
  }

  /// Cache a single custom value from the JSON using a dot-path.
  ///
  /// Example:
  /// ```dart
  /// .cacheCustomKey('access_token', path: 'accessToken')
  /// .cacheCustomKey('refresh_token', path: 'data.refreshToken')
  /// ```
  BaseBondApiRequest<T> cacheCustomKey(String key, {required String path}) {
    _builder.cacheCustomKey(key, path: path);
    return this;
  }

  /// Shortcut to extract a token from the response JSON and store it securely
  /// in [FlutterSecureStorage] (via the underlying builder).
  ///
  /// Example:
  /// ```dart
  /// .cacheToken(path: 'accessToken')
  /// ```
  BaseBondApiRequest<T> cacheToken({required String path}) {
    _builder.cacheToken(path: path);
    return this;
  }

  /// Execute the request once and return the parsed model.
  Future<T> execute() async {
    final result = await _builder.execute();
    return result as T;
  }

  /// Execute the request as a stream with cache-then-network behavior.
  ///
  /// - First emits cached value (if any)
  /// - Then emits fresh value from the network
  Stream<T> executeStream() {
    _builder.stream();
    return _builder.execute() as Stream<T>;
  }
}
