class BannersModel {
  BannersModel({
      this.id, 
      this.title, 
      this.description, 
      this.image, 
      this.imageUrl, 
      this.videoUrl, 
      this.targetUrl, 
      this.type, 
      this.position, 
      this.displayOrder, 
      this.startDate, 
      this.endDate, 
      this.isActive, 
      this.status,});

  BannersModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    imageUrl = json['image_url'];
    videoUrl = json['video_url'];
    targetUrl = json['target_url'];
    type = json['type'];
    position = json['position'];
    displayOrder = json['display_order'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isActive = json['is_active'];
    status = json['status'];
  }
  num? id;
  String? title;
  String? description;
  String? image;
  String? imageUrl;
  dynamic videoUrl;
  String? targetUrl;
  String? type;
  String? position;
  num? displayOrder;
  String? startDate;
  String? endDate;
  bool? isActive;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['image'] = image;
    map['image_url'] = imageUrl;
    map['video_url'] = videoUrl;
    map['target_url'] = targetUrl;
    map['type'] = type;
    map['position'] = position;
    map['display_order'] = displayOrder;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['is_active'] = isActive;
    map['status'] = status;
    return map;
  }


  static List<BannersModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => BannersModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }




}