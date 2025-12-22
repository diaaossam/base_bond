import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescriptionSection extends StatefulWidget {
  final ProductModel product;

  const ProductDescriptionSection({super.key, required this.product});

  @override
  State<ProductDescriptionSection> createState() =>
      _ProductDescriptionSectionState();
}

class _ProductDescriptionSectionState extends State<ProductDescriptionSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description =
        widget.product.description ?? context.localizations.noDescription;
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.title(
                text: context.localizations.description,
                textSize: 12,
                fontWeight: FontWeight.w700,
              ),
              if (description.length > 100)
                TextButton(
                  onPressed: () => setState(() => _isExpanded = !_isExpanded),
                  child: AppText(
                    text: _isExpanded
                        ? context.localizations.showLess
                        : context.localizations.showMore,
                    textSize: 13,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.primary,
                  ),
                ),
            ],
          ),
          SizedBox(height: 12.h),
          AppText.body(
            text: description,
            textSize: 11,
            maxLines: _isExpanded ? null : 4,
            textHeight: 1.6,
          ),
        ],
      ),
    );
  }
}


