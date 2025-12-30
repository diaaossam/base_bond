import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/main/data/models/category_model.dart';
import 'package:bond/features/product/presentation/cubit/category/category_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_chip_widget.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/dependencies/injectable_dependencies.dart';
import '../../active_substance/substance_loading_shimmer.dart';

class CategoryFilterSection extends StatelessWidget {
  final int? selectedCategoryId;
  final Function(int?) onCategorySelected;

  const CategoryFilterSection({
    super.key,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: context.localizations.category),
        BlocProvider(
          create: (context) => sl<CategoryCubit>()..getCategories(),
          child: BlocBuilder<CategoryCubit, BaseState<List<CategoryModel>>>(
            builder: (context, state) {
              if (state.isLoading) {
                return SubstanceLoadingShimmer();
              }
              final categories = state.data ?? [];
              return Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  FilterChipWidget(
                    label: context.localizations.all,
                    isSelected: selectedCategoryId == null,
                    onTap: () => onCategorySelected(null),
                  ),
                  ...categories.map((category) {
                    final id = category.id?.toInt();
                    final isSelected = id == selectedCategoryId;
                    return FilterChipWidget(
                      label: category.title ?? '',
                      isSelected: isSelected,
                      onTap: () => onCategorySelected(isSelected ? null : id),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

