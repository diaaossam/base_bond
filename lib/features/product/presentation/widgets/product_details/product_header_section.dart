import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/product/presentation/widgets/product_details/product_description_section.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductHeaderSection extends StatelessWidget {
  final ProductModel product;

  const ProductHeaderSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        AppText.title(
          text: product.title ?? '',
          textSize: 14,
          fontWeight: FontWeight.w700,
          maxLines: 2,
        ),

        SizedBox(height: 12.h),
        if (product.averageRating != null || product.totalReviews != null)
          Row(
            children: [
              if (product.averageRating != null) ...[
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppImage.asset(
                        Assets.icons.starFilled,
                        size: 16.sp,
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4.w),
                      AppText(
                        text: product.averageRating!.toStringAsFixed(1),
                        textSize: 14,
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
              ],
              if (product.totalReviews != null)
                AppText.hint(text: '(${product.totalReviews})', textSize: 13),
            ],
          ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            if (product.isBestSeller == true)
              _buildBadge(
                context,
                context.localizations.bestSellers,
                context.colorScheme.primary,
              ),
            if (product.isNewArrival == true)
              _buildBadge(
                context,
                context.localizations.newArrivals,
                Colors.green,
              ),
            if (product.isFeatured == true)
              _buildBadge(
                context,
                context.localizations.recommendedProducts,
                Colors.orange,
              ),
          ],
        ),
        SizedBox(height: 20.h),

        ProductDescriptionSection(product: product),

      ],
    );
  }

  Widget _buildBadge(BuildContext context, String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: AppText(
        text: text,
        textSize: 11,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}


