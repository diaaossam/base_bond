import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/toggle_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialFiltersSection extends StatelessWidget {
  final bool isFeatured;
  final bool isNewArrival;
  final bool isBestSeller;
  final Function(bool) onFeaturedChanged;
  final Function(bool) onNewArrivalChanged;
  final Function(bool) onBestSellerChanged;

  const SpecialFiltersSection({
    super.key,
    required this.isFeatured,
    required this.isNewArrival,
    required this.isBestSeller,
    required this.onFeaturedChanged,
    required this.onNewArrivalChanged,
    required this.onBestSellerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: context.localizations.specialOptions),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            ToggleChipWidget(
              label: context.localizations.featured,
              isSelected: isFeatured,
              onTap: () => onFeaturedChanged(!isFeatured),
            ),
            ToggleChipWidget(
              label: context.localizations.newArrivals,
              isSelected: isNewArrival,
              onTap: () => onNewArrivalChanged(!isNewArrival),
            ),
            ToggleChipWidget(
              label: context.localizations.bestSellers,
              isSelected: isBestSeller,
              onTap: () => onBestSellerChanged(!isBestSeller),
            ),
          ],
        ),
      ],
    );
  }
}

