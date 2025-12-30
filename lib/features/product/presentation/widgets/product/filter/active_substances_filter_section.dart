import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/product/presentation/cubit/active_substances/active_substances_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_chip_widget.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/dependencies/injectable_dependencies.dart';
import '../../active_substance/substance_loading_shimmer.dart';

class ActiveSubstancesFilterSection extends StatelessWidget {
  final int? selectedActiveSubstanceId;
  final Function(int?) onActiveSubstanceSelected;

  const ActiveSubstancesFilterSection({
    super.key,
    required this.selectedActiveSubstanceId,
    required this.onActiveSubstanceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: context.localizations.activeSubstances),
        BlocProvider(
          create: (context) => sl<ActiveSubstancesCubit>()..getActiveSubstances(),
          child: BlocBuilder<ActiveSubstancesCubit, BaseState<List<GenericModel>>>(
            builder: (context, state) {
              if (state.isLoading) {
                return SubstanceLoadingShimmer();
              }
              final activeSubstances = state.data ?? [];
              return Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  FilterChipWidget(
                    label: context.localizations.all,
                    isSelected: selectedActiveSubstanceId == null,
                    onTap: () => onActiveSubstanceSelected(null),
                  ),
                  ...activeSubstances.map((substance) {
                    final id = substance.id;
                    final isSelected = id == selectedActiveSubstanceId;
                    return FilterChipWidget(
                      label: substance.title ?? '',
                      isSelected: isSelected,
                      onTap: () => onActiveSubstanceSelected(isSelected ? null : id),
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



