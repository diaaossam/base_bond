class CategoryModel {
  CategoryModel({this.id, this.title, this.image});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }

  num? id;
  String? title;
  String? image;
}
