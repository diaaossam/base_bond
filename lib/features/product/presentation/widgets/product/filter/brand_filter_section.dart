import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/product/presentation/cubit/brand/brand_cubit.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_chip_widget.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../config/dependencies/injectable_dependencies.dart';
import '../../active_substance/substance_loading_shimmer.dart';

class BrandFilterSection extends StatelessWidget {
  final int? selectedBrandId;
  final Function(int?) onBrandSelected;

  const BrandFilterSection({
    super.key,
    required this.selectedBrandId,
    required this.onBrandSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: context.localizations.brand),
        BlocProvider(
          create: (context) => sl<BrandCubit>()..getBrands(),
          child: BlocBuilder<BrandCubit, BaseState<List<GenericModel>>>(
            builder: (context, state) {
              if (state.isLoading) {
                return SubstanceLoadingShimmer();
              }
              final brands = state.data ?? [];
              return Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  FilterChipWidget(
                    label: context.localizations.all,
                    isSelected: selectedBrandId == null,
                    onTap: () => onBrandSelected(null),
                  ),
                  ...brands.map((brand) {
                    final id = brand.id;
                    final isSelected = id == selectedBrandId;
                    return FilterChipWidget(
                      label: brand.title ?? '',
                      isSelected: isSelected,
                      onTap: () => onBrandSelected(isSelected ? null : id),
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

