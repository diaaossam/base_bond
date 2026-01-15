import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:bond/features/main/presentation/cubit/category_details/category_details_cubit.dart';
import 'package:bond/features/main/presentation/cubit/category_details/category_details_data.dart';
import 'package:bond/features/main/presentation/widget/category_details/category_sidebar.dart';
import 'package:bond/features/main/presentation/widget/category_details/subdivision_list.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class CategoriesDetailsScreen extends StatelessWidget {
  final CategoryModel category;

  const CategoriesDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CategoryDetailsCubit>()
            ..getSubCategories(categoryId: category.id ?? 0),
      child: Scaffold(
        appBar: CustomAppBar(
          title: category.title ?? context.localizations.categories,
        ),
        body: BlocBuilder<CategoryDetailsCubit, BaseState<CategoryDetailsData>>(
          builder: (context, state) {
            final data = state.data ?? CategoryDetailsData();
            final isLoadingSubcategories =
                state.isLoading && state.identifier == 'subcategories';
            return Row(
              children: [
                // Main Content - Subdivisions
                Expanded(
                  flex: 4,
                  child: SubdivisionList(
                    subdivisions: data.subDivisionList,
                    selectedSubDivisionId: data.selectedSubDivisionId,
                    selectedSubCategory: data.selectedSubCategory,
                    isLoading:
                        state.isLoading && state.identifier == 'subdivisions',
                    categoryId: category.id ?? 0,
                  ),
                ),

                // Sidebar - Subcategories
                CategorySidebar(
                  categoryId: category.id ?? 0,
                  subcategories: data.subCategoryList,
                  selectedSubCategory: data.selectedSubCategory,
                  isLoading: isLoadingSubcategories,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
