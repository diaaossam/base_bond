class ConvertersHelper {
  static List<T> fromJsonList<T>(
    Map<String, dynamic> response,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static T fromJson<T>(
    Map<String, dynamic> response,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    final Map<String, dynamic> data = response['data'] as Map<String, dynamic>;
    return fromJson(data);
  }
}
