import 'package:equatable/equatable.dart';

class GenericModel extends Equatable {
  final int? id;
  final String? title;
  final num? shippingPrice;

  const GenericModel({
    required this.id,
    required this.title,
    this.shippingPrice,
  });

  factory GenericModel.fromJson(Map<String, dynamic> map) => GenericModel(
    id: map['id'],
    title: map['title'],
    shippingPrice: map['shipping_price'],
  );

  static List<GenericModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => GenericModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  static List<GenericModel> fromJsonCitiesList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data']['cities'] as List<dynamic>;
    return dataList
        .map((item) => GenericModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    if (shippingPrice != null) "shipping_price": shippingPrice,
  };

  @override
  List<Object?> get props => [id, title, shippingPrice];
}
