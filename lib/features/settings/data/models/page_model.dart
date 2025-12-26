class PageModel {
  PageModel({
      this.id, 
      this.title, 
      this.description,});

  PageModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
  }
  num? id;
  String? title;
  String? description;
PageModel copyWith({  num? id,
  String? title,
  String? description,
}) => PageModel(  id: id ?? this.id,
  title: title ?? this.title,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}