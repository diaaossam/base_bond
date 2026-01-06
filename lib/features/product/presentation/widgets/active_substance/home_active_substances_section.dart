import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/product/presentation/cubit/active_substances/active_substances_cubit.dart';
import 'package:bond/features/product/presentation/widgets/active_substance/active_substance_chip_design.dart';
import 'package:bond/features/product/presentation/widgets/active_substance/substance_loading_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/dependencies/injectable_dependencies.dart';
import '../../../../../widgets/section_header.dart';

class HomeActiveSubstancesSection extends StatelessWidget {
  const HomeActiveSubstancesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ActiveSubstancesCubit>()..getActiveSubstances(),
      child: BlocBuilder<ActiveSubstancesCubit, BaseState<List<GenericModel>>>(
        builder: (context, state) {
          if (state.isLoading) {
            return SliverToBoxAdapter(child: SubstanceLoadingShimmer());
          }

          final activeSubstances = state.data ?? [];
          if (activeSubstances.isEmpty) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }

          final displaySubstances = activeSubstances.take(6).toList();

          return SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(20),
                color: context.colorScheme.surfaceContainer,
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SectionHeader(
                    title: context.localizations.activeSubstances,
                    actionText: context.localizations.seeAll,
                    onActionTap: () {
                      context.router.push(const AllActiveSubstancesRoute());
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Wrap(
                      spacing: 6.w,
                      runSpacing: 8.h,
                      children: List.generate(displaySubstances.length, (
                        index,
                      ) {
                        final substance = displaySubstances[index];
                        return TweenAnimationBuilder<double>(
                          duration: Duration(milliseconds: 400 + (index * 50)),
                          tween: Tween(begin: 0.0, end: 1.0),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: value,
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
                  ),
                  10.verticalSpace,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}








