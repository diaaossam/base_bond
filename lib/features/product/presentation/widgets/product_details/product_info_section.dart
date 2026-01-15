import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoSection extends StatelessWidget {
  final ProductModel product;

  const ProductInfoSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.title(
            text: context.localizations.productInfo,
            textSize: 12,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              _buildInfoRow(
                context,
                context.localizations.stock,
                _getStockStatus(context),
                Icons.inventory_2_outlined,
                statusColor: _getStockColor(context),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  context.router.push(AllProductsRoute(
                      title: product.activeSubstance?.title ?? "",
                      initialParams: ProductParams(activeSubstanceId: product.activeSubstance?.id)));
                },
                child: _buildInfoRow(
                  context,
                  context.localizations.activeSubstance,
                  product.activeSubstance?.title ?? "",
                  Icons.data_exploration,
                  statusColor: _getStockColor(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              _buildInfoRow(
                context,
                context.localizations.sku,
                product.sku ?? context.localizations.notAvailable,
                Icons.qr_code_outlined,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              if (product.category != null) ...[
                InkWell(
                  onTap: () {
                    context.router.push(AllProductsRoute(
                        title: product.category?.title ?? "",
                        initialParams: ProductParams(categoryId: product.category?.id)));
                  },
                  child: _buildInfoRow(
                    context,
                    context.localizations.category,
                    product.category!.title ?? '',
                    Icons.category_outlined,
                  ),
                ),
                SizedBox(height: 20.h),
              ],

              if (product.subCategory != null) ...[
                InkWell(
                  onTap: () {
                    context.router.push(AllProductsRoute(
                        title: product.subCategory?.title ?? "",
                        initialParams: ProductParams(subCategoryId: product.subCategory?.id)));
                  },
                  child: _buildInfoRow(
                    context,
                    context.localizations.subCategory,
                    product.subCategory!.title ?? '',
                    Icons.card_travel_outlined,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
              if (product.division != null) ...[
                InkWell(
                  onTap: () {
                    context.router.push(AllProductsRoute(
                        title: product.division?.title ?? "",
                        initialParams: ProductParams(subCategoryId: product.division?.id)));
                  },
                  child: _buildInfoRow(
                    context,
                    context.localizations.division,
                    product.division!.title ?? '',
                    Icons.compare_outlined,
                  ),
                ),
                SizedBox(height: 20.h),
              ],

              if (product.brand != null) ...[
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () {
                    context.router.push(AllProductsRoute(
                        title: product.brand?.title ?? "",
                        initialParams: ProductParams(brandId: product.brand?.id)));

                  },
                  child: _buildInfoRow(
                    context,
                    context.localizations.brand,
                    product.brand!.title ?? '',
                    Icons.branding_watermark_outlined,
                  ),
                ),
              ],
              if (product.weightKg != null) ...[
                _buildInfoRow(
                  context,
                  context.localizations.weight,
                  '${product.weightKg} ${context.localizations.kg}',
                  Icons.scale_outlined,
                ),
              ],
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              if (product.dimensions != null) ...[
                SizedBox(height: 12.h),
                _buildInfoRow(
                  context,
                  context.localizations.dimensions,
                  '${product.dimensions!.length} × ${product.dimensions!
                      .width} × ${product.dimensions!.height} ${context
                      .localizations.cm}',
                  Icons.aspect_ratio_outlined,
                ),
              ],
            ],
          ),

        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context,
      String label,
      String value,
      IconData icon, {
        Color? statusColor,
      }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: (statusColor ?? context.colorScheme.primary)
                .withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            icon,
            size: 17.sp,
            color: statusColor ?? context.colorScheme.primary,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.hint(
                text: label,
                textSize: 10,
              ),
              SizedBox(height: 8.h),
              AppText(
                text: value,
                textSize: 11,
                maxLines: 3,
                fontWeight: FontWeight.w600,
                color: statusColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getStockStatus(BuildContext context) {
    if (product.currentStock == null) {
      return context.localizations.notAvailable;
    }
    final stock = int.tryParse(product.currentStock ?? '0') ?? 0;
    if (stock > 0) {
      return '${context.localizations.available} ($stock)';
    }
    return context.localizations.notAvailable;
  }

  Color? _getStockColor(BuildContext context) {
    if (product.currentStock == null) {
      return context.colorScheme.error;
    }
    final stock = int.tryParse(product.currentStock ?? '0') ?? 0;
    if (stock > 0) {
      return Colors.green;
    }
    return context.colorScheme.error;
  }
}


