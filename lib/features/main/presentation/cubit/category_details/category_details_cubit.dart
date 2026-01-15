import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/product/data/repositories/product_repository_impl.dart';
import 'package:injectable/injectable.dart';

import 'category_details_data.dart';

@Injectable()
class CategoryDetailsCubit extends Cubit<BaseState<CategoryDetailsData>>
    with AsyncHandler<CategoryDetailsData> {
  final ProductRepositoryImpl productRepositoryImpl;

  CategoryDetailsCubit(this.productRepositoryImpl)
    : super(BaseState(data: CategoryDetailsData()));

  Future<void> getSubCategories({required num categoryId}) async {
    await handleAsync(
      call: () => productRepositoryImpl.getSubcategory(id: categoryId),
      identifier: 'subcategories',
      onSuccess: (data) {
        final currentData = state.data ?? CategoryDetailsData();
        return currentData.copyWith(
          subCategoryList: data,
          selectedSubCategory: data.isNotEmpty ? data.first : null,
          subDivisionList: [],
          clearSelectedSubDivision: true,
        );
      },
    );

    final selectedSub = state.data?.selectedSubCategory;
    if (selectedSub?.id != null) {
      getSubDivisions(categoryId: categoryId, id: selectedSub!.id!);
    }
  }

  /// Fetch subdivisions for a given subcategory
  Future<void> getSubDivisions({
    required num id,
    required num categoryId,
  }) async {
    await handleAsync(
      call: () => productRepositoryImpl.getSubDivision(id: id, categoryId: categoryId),
      identifier: 'subdivisions',
      onSuccess: (data) {
        final currentData = state.data ?? CategoryDetailsData();
        return currentData.copyWith(subDivisionList: data);
      },
    );
  }

  void selectSubCategory({
    required GenericModel subCategory,
    required num categoryId,
  }) {
    final currentData = state.data ?? CategoryDetailsData();
    emit(
      state.copyWith(
        data: currentData.copyWith(
          selectedSubCategory: subCategory,
          subDivisionList: [],
          clearSelectedSubDivision: true,
        ),
      ),
    );

    if (subCategory.id != null) {
      getSubDivisions(categoryId: categoryId, id: subCategory.id!);
    }
  }

  /// Toggle subdivision expansion
  void toggleSubDivision(int? id) {
    final currentData = state.data ?? CategoryDetailsData();
    final newId = currentData.selectedSubDivisionId == id ? null : id;
    emit(
      state.copyWith(
        data: currentData.copyWith(
          selectedSubDivisionId: newId,
          clearSelectedSubDivision: newId == null,
        ),
      ),
    );
  }
}
