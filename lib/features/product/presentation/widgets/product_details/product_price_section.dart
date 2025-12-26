import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/presentation/cubit/details/product_details_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPriceSection extends StatelessWidget {
  final ProductModel product;

  const ProductPriceSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.discountPercentage != null && product.discountPercentage! > 0;
    return BlocBuilder<ProductDetailsCubit, BaseState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: context.colorScheme.primaryContainer.withValues(
                alpha: 0.3,
              ),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sale Price
                  Row(
                    children: [
                      AppText(
                        text: product.salePrice?.toStringAsFixed(0) ?? '0',
                        textSize: 16,
                        fontWeight: FontWeight.w800,
                        color: context.colorScheme.primary,
                      ),
                      SizedBox(width: 6.w),
                      AppText(
                        text: context.localizations.egp,
                        textSize: 14,
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.8,
                        ),
                      ),
                    ],
                  ),

                  // Old Price (if discount exists)
                  if (hasDiscount && product.oldPrice != null) ...[
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        AppText(
                          text: product.oldPrice!.toStringAsFixed(0),
                          textSize: 12,
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.shadow,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                        SizedBox(width: 4.w),
                        AppText(
                          text: context.localizations.egp,
                          textSize: 11,
                          fontWeight: FontWeight.w500,
                          color: context.colorScheme.shadow,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              if (hasDiscount)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.error,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      AppText(
                        text: context.localizations.discount,
                        textSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      SizedBox(height: 2.h),
                      AppText(
                        text:
                            '${product.discountPercentage!.toStringAsFixed(0)}%',
                        textSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
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
}
