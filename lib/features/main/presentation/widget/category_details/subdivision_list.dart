import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/main/presentation/cubit/category_details/category_details_cubit.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SubdivisionList extends StatelessWidget {
  final List<GenericModel> subdivisions;
  final int? selectedSubDivisionId;
  final GenericModel? selectedSubCategory;
  final bool isLoading;
  final num categoryId;

  const SubdivisionList({
    super.key,
    required this.subdivisions,
    required this.selectedSubDivisionId,
    required this.selectedSubCategory,
    required this.isLoading,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with selected subcategory
          _buildHeader(context),

          // Subdivisions list
          Expanded(
            child: isLoading
                ? _buildShimmer(context)
                : subdivisions.isEmpty
                    ? _buildEmptyState(context)
                    : _buildList(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.category_rounded,
              color: context.colorScheme.primary,
              size: 22.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.hint(
                  text: context.localizations.categories,
                  textSize: 10,
                ),
                SizedBox(height: 2.h),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: AppText.title(
                    key: ValueKey(selectedSubCategory?.id),
                    text: selectedSubCategory?.title ?? '...',
                    textSize: 14,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64.sp,
            color: context.colorScheme.shadow.withValues(alpha: 0.5),
          ),
          SizedBox(height: 16.h),
          AppText.hint(
            text: context.localizations.noProductsTitle,
            textSize: 14,
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const BouncingScrollPhysics(),
      itemCount: subdivisions.length,
      itemBuilder: (context, index) {
        final subdivision = subdivisions[index];
        final isExpanded = selectedSubDivisionId == subdivision.id;

        return _SubdivisionCard(
          subdivision: subdivision,
          isExpanded: isExpanded,
          index: index,
          categoryId: categoryId,
          selectedSubCategory: selectedSubCategory,
        );
      },
    );
  }
}

class _SubdivisionCard extends StatelessWidget {
  final GenericModel subdivision;
  final bool isExpanded;
  final int index;
  final num categoryId;
  final GenericModel? selectedSubCategory;

  const _SubdivisionCard({
    required this.subdivision,
    required this.isExpanded,
    required this.index,
    required this.categoryId,
    required this.selectedSubCategory,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + (index * 80)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          context.read<CategoryDetailsCubit>().toggleSubDivision(subdivision.id);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: isExpanded
                  ? context.colorScheme.primary.withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: isExpanded
                    ? context.colorScheme.primary.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.04),
                blurRadius: isExpanded ? 16 : 8,
                offset: Offset(0, isExpanded ? 6 : 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Main row
              Padding(
                padding: EdgeInsets.all(14.r),
                child: Row(
                  children: [
                    // Icon container
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: isExpanded
                            ? context.colorScheme.primary
                            : context.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.local_pharmacy_rounded,
                        color: isExpanded
                            ? Colors.white
                            : context.colorScheme.primary,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),

                    // Title
                    Expanded(
                      child: AppText(
                        text: subdivision.title ?? '',
                        textSize: 12,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                    ),

                    // Arrow icon
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 300),
                      turns: isExpanded ? 0.25 : 0,
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: context.colorScheme.primary,
                        size: 24.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // Expanded content
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 350),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox.shrink(),
                secondChild: _buildExpandedContent(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(14.w, 0, 14.w, 14.h),
      child: Column(
        children: [
          Divider(
            color: context.colorScheme.outline,
            height: 1,
          ),
          SizedBox(height: 12.h),
          
          // Action button
          _ActionButton(
            icon: Icons.shopping_bag_outlined,
            label: context.localizations.products,
            onTap: () {
              context.router.push(
                AllProductsRoute(
                  title: subdivision.title ?? '',
                  initialParams: ProductParams(
                    categoryId: subdivision.id,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: context.colorScheme.primary,
                size: 20.sp,
              ),
              SizedBox(width: 8.w),
              AppText(
                text: label,
                textSize: 12,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary,
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward_rounded,
                color: context.colorScheme.primary,
                size: 18.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

