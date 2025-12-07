import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class DioCacheStore {
  static final DioCacheStore _instance = DioCacheStore._internal();

  factory DioCacheStore() => _instance;

  DioCacheStore._internal();

  final Map<String, _CacheEntry> _memoryCache = {};

  Future<String> _filePathForKey(String key) async {
    final dir = await getTemporaryDirectory();
    return "${dir.path}/dio_cache_$key.json";
  }

  Future<void> set(String key, dynamic data, {Duration? ttl}) async {
    final entry = _CacheEntry(
      data: data,
      expiry: ttl == null ? null : DateTime.now().add(ttl),
    );

    // Memory
    _memoryCache[key] = entry;

    // File
    final file = File(await _filePathForKey(key));
    await file.writeAsString(jsonEncode(entry.toJson()));
  }

  Future<dynamic> get(String key) async {
    // Memory check
    if (_memoryCache.containsKey(key)) {
      final entry = _memoryCache[key]!;
      if (!entry.isExpired) return entry.data;
    }

    // File check
    final file = File(await _filePathForKey(key));
    if (await file.exists()) {
      final jsonData = jsonDecode(await file.readAsString());
      final entry = _CacheEntry.fromJson(jsonData);

      if (!entry.isExpired) {
        // save back to memory
        _memoryCache[key] = entry;
        return entry.data;
      }
    }

    return null;
  }

  Future<void> clearKey(String key) async {
    _memoryCache.remove(key);
    final file = File(await _filePathForKey(key));
    if (await file.exists()) file.delete();
  }

  Future<void> clearAll() async {
    _memoryCache.clear();
  }
}

class _CacheEntry {
  final dynamic data;
  final DateTime? expiry;

  _CacheEntry({required this.data, this.expiry});

  bool get isExpired => expiry != null && DateTime.now().isAfter(expiry!);

  Map<String, dynamic> toJson() => {
    'data': data,
    'expiry': expiry?.toIso8601String(),
  };

  factory _CacheEntry.fromJson(Map<String, dynamic> json) => _CacheEntry(
    data: json['data'],
    expiry: json['expiry'] == null ? null : DateTime.parse(json['expiry']),
  );
}
