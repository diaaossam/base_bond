import '../../../../../core/global_models/generic_model.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.points,
    this.customerCompleteProfile,
    this.orders,
    this.province,
    this.region,
    this.image,
    this.createdAt,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    points = json['points'];
    orders = json['orders'];
    province = json['province'] != null
        ? GenericModel.fromJson(json['province'])
        : null;
    region = json['region'] != null
        ? GenericModel.fromJson(json['region'])
        : null;
    customerCompleteProfile = json['customer_complete_profile'] == 1;
    image = json['image'];

    createdAt = json['created_at'];
  }

  num? id;
  String? name;
  String? phone;
  String? email;
  num? points;
  num? orders;
  GenericModel? province;
  GenericModel? region;
  bool? customerCompleteProfile;
  String? image;
  String? createdAt;

  UserModel copyWith({
    num? id,
    String? name,
    String? phone,
    String? email,
    num? points,
    num? orders,
    GenericModel? province,
    GenericModel? region,
    bool? customerCompleteProfile,
    String? image,
    String? createdAt,
  }) => UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    email: email ?? this.email,
    points: points ?? this.points,
    orders: orders ?? this.orders,
    province: province ?? this.province,
    region: region ?? this.region,
    customerCompleteProfile:
        customerCompleteProfile ?? this.customerCompleteProfile,
    image: image ?? this.image,
    createdAt: createdAt ?? this.createdAt,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['points'] = points;
    map['orders'] = orders;
    if (province != null) {
      map['province'] = province?.toMap();
    }
    if (region != null) {
      map['region'] = region?.toMap();
    }
    map['customer_complete_profile'] = customerCompleteProfile;
    map['image'] = image;
    map['created_at'] = createdAt;
    return map;
  }
}
