import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/main/presentation/cubit/category_details/category_details_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategorySidebar extends StatelessWidget {
  final List<GenericModel> subcategories;
  final GenericModel? selectedSubCategory;
  final bool isLoading;

  const CategorySidebar({
    super.key,
    required this.subcategories,
    required this.selectedSubCategory,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.2),
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(24.r),
        ),
      ),
      child: isLoading
          ? _buildShimmer(context)
          : _buildSubcategoryList(context),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubcategoryList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: const BouncingScrollPhysics(),
      itemCount: subcategories.length,
      itemBuilder: (context, index) {
        final subcategory = subcategories[index];
        final isSelected = selectedSubCategory?.id == subcategory.id;

        return _SubcategoryItem(
          subcategory: subcategory,
          isSelected: isSelected,
          index: index,
        );
      },
    );
  }
}

class _SubcategoryItem extends StatelessWidget {
  final GenericModel subcategory;
  final bool isSelected;
  final int index;

  const _SubcategoryItem({
    required this.subcategory,
    required this.isSelected,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 50)),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(50 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          context.read<CategoryDetailsCubit>().selectSubCategory(subcategory);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Row(
            children: [
              // Selection Indicator
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 3.w,
                height: isSelected ? 24.h : 0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              if (isSelected) SizedBox(width: 6.w),
              
              // Title
              Expanded(
                child: AppText(
                  text: subcategory.title ?? '',
                  textSize: 10,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : context.colorScheme.onSurface,
                  maxLines: 3,
                  align: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


