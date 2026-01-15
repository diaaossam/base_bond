import 'package:equatable/equatable.dart';

class ProductParams extends Equatable {
  const ProductParams({
    this.page = 1,
    this.search,
    this.sortBy,
    this.categoryId,
    this.brandId,
    this.activeSubstanceId,
    this.priceFrom,
    this.priceTo,
    this.isFeatured,
    this.isNewArrival,
    this.isBestSeller,
    this.ids,
    this.divisionId,
    this.subCategoryId,
  });

  final int page;
  final String? search;
  final String? sortBy;

  final int? categoryId;
  final int? subCategoryId;
  final int? divisionId;
  final int? brandId;
  final int? activeSubstanceId;

  final int? priceFrom;
  final int? priceTo;
  final List<num>? ids;

  final bool? isFeatured;
  final bool? isNewArrival;
  final bool? isBestSeller;

  ProductParams copyWith({
    int? page,
    String? search,
    String? sortBy,
    int? categoryId,
    int? brandId,
    int? divisionId,
    int? subCategoryId,
    int? activeSubstanceId,
    int? priceFrom,
    int? priceTo,
    bool? isFeatured,
    bool? isNewArrival,
    bool? isBestSeller,
    List<num>? ids,
  }) {
    return ProductParams(
      page: page ?? this.page,
      search: search ?? this.search,
      sortBy: sortBy ?? this.sortBy,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      activeSubstanceId: activeSubstanceId ?? this.activeSubstanceId,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      isFeatured: isFeatured ?? this.isFeatured,
      isNewArrival: isNewArrival ?? this.isNewArrival,
      isBestSeller: isBestSeller ?? this.isBestSeller,
      ids: ids ?? this.ids,
      divisionId: divisionId ?? this.divisionId,
      subCategoryId: subCategoryId ?? this.subCategoryId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      if (search != null && search!.isNotEmpty) 'search': search,
      if (sortBy != null) 'sort_by': sortBy,
      if (categoryId != null) 'category_id': categoryId,
      if (subCategoryId != null) 'sub_category_id': subCategoryId,
      if (brandId != null) 'brand_id': brandId,
      if (divisionId != null) 'division_category_id': divisionId,
      if (activeSubstanceId != null) 'active_substance_id': activeSubstanceId,
      if (priceFrom != null) 'price_from': priceFrom,
      if (priceTo != null) 'price_to': priceTo,
      if (isFeatured != null) 'is_featured': isFeatured! ? 1 : 0,
      if (isNewArrival != null) 'is_new_arrival': isNewArrival! ? 1 : 0,
      if (isBestSeller != null) 'is_best_seller': isBestSeller! ? 1 : 0,
      if (ids != null) 'ids[]': ids,
    };
  }

  @override
  List<Object?> get props => [
    page,
    search,
    sortBy,
    categoryId,
    brandId,
    activeSubstanceId,
    priceFrom,
    priceTo,
    isFeatured,
    isNewArrival,
    isBestSeller,
    ids,
    subCategoryId,
    divisionId

  ];
}
