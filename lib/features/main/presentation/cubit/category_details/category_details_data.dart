import 'package:bond/core/global_models/generic_model.dart';

class CategoryDetailsData {
  final List<GenericModel> subCategoryList;
  final List<GenericModel> subDivisionList;
  final GenericModel? selectedSubCategory;
  final int? selectedSubDivisionId;

  CategoryDetailsData({
    this.subCategoryList = const [],
    this.subDivisionList = const [],
    this.selectedSubCategory,
    this.selectedSubDivisionId,
  });

  CategoryDetailsData copyWith({
    List<GenericModel>? subCategoryList,
    List<GenericModel>? subDivisionList,
    GenericModel? selectedSubCategory,
    int? selectedSubDivisionId,
    bool clearSelectedSubDivision = false,
  }) {
    return CategoryDetailsData(
      subCategoryList: subCategoryList ?? this.subCategoryList,
      subDivisionList: subDivisionList ?? this.subDivisionList,
      selectedSubCategory: selectedSubCategory ?? this.selectedSubCategory,
      selectedSubDivisionId: clearSelectedSubDivision
          ? null
          : (selectedSubDivisionId ?? this.selectedSubDivisionId),
    );
  }
}
