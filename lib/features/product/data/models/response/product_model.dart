import 'package:bond/core/global_models/generic_model.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.sku,
    this.title,
    this.description,
    this.category,
    this.brand,
    this.discountPercentage,
    this.salePrice,
    this.weightKg,
    this.dimensions,
    this.isFeatured,
    this.isNewArrival,
    this.isBestSeller,
    this.totalViews,
    this.averageRating,
    this.totalReviews,
    this.currentStock,
    this.featureImage,
    this.images,
    this.status,
    this.oldPrice,
    this.isAddedToFavourite,
    this.activeSubstance
  });

  ProductModel.fromJson({
    required Map<String, dynamic> json,
    required bool isRemote,
  }) {
    id = json['id'];
    sku = json['sku'];
    title = json['title'];
    description = json['description'];
    category = json['category'] != null
        ? GenericModel.fromJson(json['category'])
        : null;
    activeSubstance = json['active_substance'] != null
        ? GenericModel.fromJson(json['active_substance'])
        : null;
    brand = json['brand'] != null ? GenericModel.fromJson(json['brand']) : null;
    discountPercentage = json['discount_percentage'];
    salePrice = json['sale_price'];
    weightKg = json['weight_kg'];
    dimensions = json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null;
    isFeatured = json['is_featured'];
    isNewArrival = json['is_new_arrival'];
    isBestSeller = json['is_best_seller'];
    totalViews = json['total_views'];
    averageRating = json['average_rating'];
    totalReviews = json['total_reviews'];
    currentStock = json['current_stock'];
    featureImage = json['feature_image'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    status = json['status'];
    isAddedToFavourite = json['is_added_to_wishlist'];
    if (isRemote) {
      if (salePrice != null &&
          discountPercentage != null &&
          (discountPercentage ?? 1) > 0) {
        oldPrice = (salePrice ?? 1) / (1 - ((discountPercentage ?? 1) / 100));
      }
    } else {
      oldPrice = json['old_price'];
    }
  }

  num? id;
  String? sku;
  String? title;
  String? description;
  GenericModel? category;
  GenericModel? brand;
  GenericModel? activeSubstance;
  num? discountPercentage;
  num? salePrice;
  num? oldPrice;
  String? weightKg;
  Dimensions? dimensions;
  bool? isFeatured;
  bool? isNewArrival;
  bool? isBestSeller;
  String? totalViews;
  num? averageRating;
  String? totalReviews;
  String? currentStock;
  String? featureImage;
  List<String>? images;
  String? status;
  bool? isAddedToFavourite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sku'] = sku;
    map['title'] = title;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toMap();
    }
    if (brand != null) {
      map['brand'] = brand?.toMap();
    }
    if (activeSubstance != null) {
      map['active_substance'] = activeSubstance?.toMap();
    }
    map['discount_percentage'] = discountPercentage;
    map['sale_price'] = salePrice;
    map['old_price'] = oldPrice;
    map['weight_kg'] = weightKg;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['is_featured'] = isFeatured;
    map['is_new_arrival'] = isNewArrival;
    map['is_best_seller'] = isBestSeller;
    map['total_views'] = totalViews;
    map['average_rating'] = averageRating;
    map['total_reviews'] = totalReviews;
    map['current_stock'] = currentStock;
    map['feature_image'] = featureImage;
    map['images'] = images;
    map['status'] = status;
    map['is_added_to_favourite'] = isAddedToFavourite;
    return map;
  }

  static List<ProductModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map(
          (item) => ProductModel.fromJson(
            json: item as Map<String, dynamic>,
            isRemote: true,
          ),
        )
        .toList();
  }
}

class Dimensions {
  Dimensions({this.length, this.width, this.height});

  Dimensions.fromJson(dynamic json) {
    length = json['length'];
    width = json['width'];
    height = json['height'];
  }

  num? length;
  num? width;
  num? height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = length;
    map['width'] = width;
    map['height'] = height;
    return map;
  }
}
