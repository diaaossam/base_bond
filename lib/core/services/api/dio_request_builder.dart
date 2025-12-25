import 'dart:async';

import 'package:bond/config/helper/token_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  /// Parser used when calling [execute] without passing a parser.
  JsonParser<T>? _parser;

  /// Optional hook to cache or persist custom values from the raw response.
  FutureOr<void> Function(dynamic responseJson)? _onResponse;

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

  /// Alias for [params] to make the intent clearer at call‑sites.
  DioRequestBuilder<T> query(Map<String, dynamic>? params) {
    return params == null ? this : this.params(params);
  }

  DioRequestBuilder<T> body(dynamic body) {
    _body = body;
    return this;
  }

  /// Convenience for sending `FormData` or any body treated as such by Dio.
  DioRequestBuilder<T> formData(dynamic formData) {
    return body(formData);
  }

  DioRequestBuilder<T> headers(Map<String, dynamic>? headers) {
    _headers = headers;
    return this;
  }

  /// Set the JSON factory that will convert the raw map into the desired model.
  DioRequestBuilder<T> factory(JsonParser<T> parser) {
    _parser = parser;
    return this;
  }

  /// Register a hook to cache or persist custom values from the raw response.
  ///
  /// This is useful for things like storing tokens or IDs alongside the normal
  /// model mapping.
  DioRequestBuilder<T> onResponse(
    FutureOr<void> Function(dynamic responseJson) callback,
  ) {
    _onResponse = callback;
    return this;
  }

  // CACHE
  DioRequestBuilder<T> cache({required String key, Duration? ttl}) {
    _cacheKey = key;
    _cacheTTL = ttl;
    return this;
  }

  /// Extract a custom value from the JSON response by a dot-path
  /// and store it in [SharedPreferences] under [key].
  ///
  /// Example:
  /// ```dart
  /// .cacheCustomKey('access_token', path: 'data.accessToken')
  /// ```
  DioRequestBuilder<T> cacheCustomKey(String key, {required String path}) {
    final segments = path.split('.');

    return onResponse((responseJson) async {
      dynamic current = responseJson;

      for (final segment in segments) {
        if (current is Map<String, dynamic> && current.containsKey(segment)) {
          current = current[segment];
        } else {
          current = null;
          break;
        }
      }

      if (current != null) {
        final prefs = await SharedPreferences.getInstance();
        if (current is String) {
          await prefs.setString(key, current);
        } else {
          await prefs.setString(key, current.toString());
        }
      }
    });
  }

  /// Extract a token from the JSON response by a dot-path
  /// and store it securely in [FlutterSecureStorage] under the `token` key.
  ///
  /// Example:
  /// ```dart
  /// .cacheToken(path: 'accessToken')
  /// ```
  DioRequestBuilder<T> cacheToken({String? value}) {
    return onResponse((responseJson) async {
      final String token = value ?? responseJson['data']['access_token'];
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      TokenDataService().setTokenData(token);
    });
  }

  DioRequestBuilder<T> stream() {
    _useStream = true;
    return this;
  }

  Future<dynamic> execute([JsonParser<T>? parser]) async {
    final effectiveParser = parser ?? _parser;
    if (effectiveParser == null) {
      throw StateError(
        'No parser provided. Use execute(parser) or call factory(...) before execute().',
      );
    }

    final cacheStore = DioCacheStore();

    if (_useStream) {
      final controller = StreamController<T>();

      if (_cacheKey != null) {
        final cached = await cacheStore.get(_cacheKey!);
        if (cached != null) {
          await _onResponse?.call(cached);
          controller.add(effectiveParser(cached));
        }
      }

      // fetch from network
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

            await _onResponse?.call(responseJson);

            controller.add(effectiveParser(responseJson));
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
        await _onResponse?.call(cached);
        return effectiveParser(cached);
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

    await _onResponse?.call(responseJson);

    return effectiveParser(responseJson);
  }
}
