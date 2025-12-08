import 'dart:async';

import '../caching/cache_store.dart';
import 'dio_consumer.dart';

typedef JsonParser<T> = T Function(Map<String, dynamic> json);

class DioRequestBuilder<T> {
  final DioConsumer _consumer;

  String? _path;
  String _method = 'GET';
  Map<String, dynamic>? _params;
  dynamic _body;
  Map<String, dynamic>? _headers;

  String? _cacheKey;
  Duration? _cacheTTL;
  bool _useStream = false;

  DioRequestBuilder(this._consumer);

  DioRequestBuilder<T> path(String path) {
    _path = path;
    return this;
  }

  DioRequestBuilder<T> method(String method) {
    _method = method;
    return this;
  }

  DioRequestBuilder<T> params(Map<String, dynamic>? params) {
    _params = params;
    return this;
  }

  DioRequestBuilder<T> body(dynamic body) {
    _body = body;
    return this;
  }

  DioRequestBuilder<T> headers(Map<String, dynamic>? headers) {
    _headers = headers;
    return this;
  }

  // CACHE
  DioRequestBuilder<T> cache({required String key, Duration? ttl}) {
    _cacheKey = key;
    _cacheTTL = ttl;
    return this;
  }

  DioRequestBuilder<T> stream() {
    _useStream = true;
    return this;
  }

  // EXECUTE
  Future<dynamic> execute(JsonParser<T> parser) async {
    final cacheStore = DioCacheStore();

    if (_useStream) {
      final controller = StreamController<T>();

      if (_cacheKey != null) {
        final cached = await cacheStore.get(_cacheKey!);
        if (cached != null) {
          controller.add(parser(cached));
        }
      }

      // 2) fetch from network
      _consumer
          .performRequest(
            path: _path!,
            method: _method,
            params: _params,
            data: _body,
            headers: _headers,
          )
          .then((responseJson) async {
            if (_cacheKey != null) {
              await cacheStore.set(_cacheKey!, responseJson, ttl: _cacheTTL);
            }

            controller.add(parser(responseJson));
            controller.close();
          })
          .catchError((e) {
            controller.addError(e);
          });

      return controller.stream;
    }

    // NORMAL MODE (no stream)
    if (_cacheKey != null) {
      final cached = await cacheStore.get(_cacheKey!);
      if (cached != null) {
        return parser(cached);
      }
    }

    final responseJson = await _consumer.performRequest(
      path: _path!,
      method: _method,
      params: _params,
      data: _body,
      headers: _headers,
    );

    if (_cacheKey != null) {
      await cacheStore.set(_cacheKey!, responseJson, ttl: _cacheTTL);
    }

    return parser(responseJson);
  }
}
