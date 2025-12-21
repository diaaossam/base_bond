import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/presentation/widgets/product/filter/filter_section_title.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceRangeFilterSection extends StatelessWidget {
  final TextEditingController priceFromController;
  final TextEditingController priceToController;

  const PriceRangeFilterSection({
    super.key,
    required this.priceFromController,
    required this.priceToController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterSectionTitle(title: context.localizations.priceRange),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: priceFromController,
                keyboardType: TextInputType.number,
                hintText: context.localizations.from,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: CustomTextFormField(
                controller: priceToController,
                keyboardType: TextInputType.number,
                hintText: context.localizations.to,

              ),
            ),
          ],
        ),
      ],
    );
  }
}

