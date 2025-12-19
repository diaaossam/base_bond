import 'dart:math';
import 'dart:ui';


class BannersModel {
  BannersModel(
      {this.id,
      this.title,
      this.image,
      this.color,
      this.type,
});

  BannersModel.fromJson(
    dynamic json,
  ) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    type = json['banner_type'];
    color = getRandomColor();
  }

  num? id;
  String? title;
  String? image;
  Color? color;
  String? type;

  Color? getRandomColor() {
    List<Color> list = [
      const Color(0xffFEE9E8),
      const Color(0xffFAFFE7),
      const Color(0xffEFEEFF),
      const Color(0xffFEF6EB),
      const Color(0xffEDF3FF),
    ];
    return list[Random().nextInt(5)];
  }
}
