import 'package:equatable/equatable.dart';

class GenericModel extends Equatable {
  final int? id;
  final String? title;
  final num? deliveryPrice;

  const GenericModel({
    required this.id,
    required this.title,
    this.deliveryPrice,
  });

  factory GenericModel.fromJson(Map<String, dynamic> map) => GenericModel(
    id: map['id'],
    title: map['title'],
    deliveryPrice: map['delivery_price'],
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
    if (deliveryPrice != null) "delivery_price": deliveryPrice,
  };

  @override
  List<Object?> get props => [id, title, deliveryPrice];
}
