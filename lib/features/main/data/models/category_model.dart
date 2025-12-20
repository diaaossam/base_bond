class CategoryModel {
  CategoryModel({this.id, this.title, this.image});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  static List<CategoryModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  num? id;
  String? title;
  String? image;
}
