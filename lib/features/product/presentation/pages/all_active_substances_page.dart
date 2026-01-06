import 'package:auto_route/annotations.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/product/presentation/cubit/active_substances/active_substances_cubit.dart';
import 'package:bond/features/product/presentation/widgets/active_substance/active_substance_chip_design.dart';
import 'package:bond/widgets/app_bar/custom_app_bar.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../core/extensions/color_extensions.dart';

@RoutePage()
class AllActiveSubstancesPage extends StatelessWidget {
  const AllActiveSubstancesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActiveSubstancesCubit>()..getActiveSubstances(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: context.localizations.allActiveSubstances,
          showBackButton: true,
        ),
        body: BlocBuilder<ActiveSubstancesCubit, BaseState<List<GenericModel>>>(
          builder: (context, state) {
            if (state.isLoading) {
              return _buildShimmer(context);
            }

            final activeSubstances = state.data ?? [];

            if (activeSubstances.isEmpty) {
              return _buildEmptyState(context);
            }

            return _buildActiveSubstancesList(activeSubstances);
          },
        ),
      ),
    );
  }

  Widget _buildActiveSubstancesList(List<GenericModel> substances) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats card
          _buildStatsCard(substances.length),
          SizedBox(height: 20.h),
          // Animated chips
          Wrap(
            spacing: 10.w,
            runSpacing: 12.h,
            children: List.generate(substances.length, (index) {
              final substance = substances[index];
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 300 + (index * 30)),
                tween: Tween(begin: 0.0, end: 1.0),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 20 * (1 - value)),
                    child: ActiveSubstanceChipDesign(
                      title: substance.title ?? '',
                      id: substance.id ?? 0,
                      index: index,
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildStatsCard(int count) {
    return Builder(
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.primary.withValues(alpha: 0.1),
                context.colorScheme.primary.withValues(alpha: 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: context.colorScheme.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.medical_services_rounded,
                  color: context.colorScheme.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: context.localizations.activeSubstances,
                      color: context.colorScheme.onSurface.withValues(
                        alpha: 0.7,
                      ),

                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 4.h),
                    AppText(
                      text: "$count ${context.localizations.available}",
                      fontWeight: FontWeight.w700,
                      color: context.colorScheme.onSurface,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(32.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.science_outlined,
              size: 80.sp,
              color: context.colorScheme.primary.withValues(alpha: 0.5),
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            context.localizations.noData,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'لا توجد مواد فعالة متاحة حالياً',
            style: TextStyle(
              fontSize: 12.sp,
              color: context.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          // Stats shimmer
          Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          SizedBox(height: 20.h),
          // Chips shimmer
          Wrap(
            spacing: 10.w,
            runSpacing: 12.h,
            children: List.generate(12, (index) {
              return Container(
                width: 90.w + (index * 8),
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.r),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}








