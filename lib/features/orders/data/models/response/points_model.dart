import 'package:equatable/equatable.dart';

class PointsModel extends Equatable {
  const PointsModel({
    this.currentUserPoints,
    this.availablePoints,
  });

  factory PointsModel.fromJson(dynamic json) {
    return PointsModel(
      currentUserPoints: json['current_user_points'],
      availablePoints: json['available_points'] != null
          ? (json['available_points'] as List)
          .map((v) => AvailablePoints.fromJson(v))
          .toList()
          : null,
    );
  }

  final String? currentUserPoints;
  final List<AvailablePoints>? availablePoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_user_points'] = currentUserPoints;
    if (availablePoints != null) {
      map['available_points'] = availablePoints!.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [currentUserPoints, availablePoints];
}

class AvailablePoints extends Equatable {
  const AvailablePoints({
    this.id,
    this.points,
    this.discount,
    this.isFreeDelivery,
  });

  factory AvailablePoints.fromJson(dynamic json) {
    return AvailablePoints(
      id: json['id'],
      points: json['points'],
      discount: json['discount'],
      isFreeDelivery: json['is_free_delivery'],
    );
  }

  final num? id;
  final num? points;
  final num? discount;
  final num? isFreeDelivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['points'] = points;
    map['discount'] = discount;
    map['is_free_delivery'] = isFreeDelivery;
    return map;
  }

  @override
  List<Object?> get props => [id, points, discount, isFreeDelivery];
}
