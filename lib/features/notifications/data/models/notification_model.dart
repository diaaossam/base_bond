class NotificationModel {
  NotificationModel({
    this.id,
    this.title,
    this.description,
    this.isRead,
    this.readAt,
    this.readAtForHumans,
    this.createdAt,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isRead = json['is_read'];
    readAt = json['read_at'];
    readAtForHumans = json['read_at_for_humans'];
    createdAt = json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : DateTime.now();
  }

  String? id;
  String? title;
  String? description;
  bool? isRead;
  String? readAt;
  String? readAtForHumans;
  DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['is_read'] = isRead;
    map['read_at'] = readAt;
    map['read_at_for_humans'] = readAtForHumans;
    map['created_at'] = createdAt;
    return map;
  }

  static List<NotificationModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => NotificationModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
