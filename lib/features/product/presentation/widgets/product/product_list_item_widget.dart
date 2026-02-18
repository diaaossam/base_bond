import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/product_model.dart';
import 'like_button.dart';

class ProductListItemWidget extends StatefulWidget {
  final ProductModel product;
  final int index;
  final bool isLiked;
  final Function(bool) onFavTapped;

  const ProductListItemWidget({
    super.key,
    required this.product,
    required this.index,
    required this.isLiked,
    required this.onFavTapped,
  });

  @override
  State<ProductListItemWidget> createState() => _ProductListItemWidgetState();
}

class _ProductListItemWidgetState extends State<ProductListItemWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hoverController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTapDown: (_) => _hoverController.forward(),
            onTapUp: (_) => _hoverController.reverse(),
            onTapCancel: () => _hoverController.reverse(),
            onTap: () {
              context.router.push(ProductDetailsRoute(product: widget.product));
            },
            child: Container(
              height: 130.h,
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Image Section
                  Container(
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(16.r),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          context.colorScheme.primary.withValues(alpha: 0.05),
                          context.colorScheme.primary.withValues(alpha: 0.02),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(16.r),
                          ),
                          child: widget.product.featureImage == null ||
                                  widget.product.featureImage!.isEmpty
                              ? AppImage.asset(
                                  Assets.images.logo.path,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                )
                              : AppImage.network(
                                  remoteImage: widget.product.featureImage ?? '',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                        ),
                        if (widget.product.discountPercentage != null &&
                            widget.product.discountPercentage != 0)
                          Positioned.directional(
                            textDirection: TextDirection.rtl,
                            end: 0,
                            top: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colorScheme.error,
                                borderRadius: BorderRadiusDirectional.horizontal(
                                  start: Radius.circular(20),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "- ${widget.product.discountPercentage.toString()} %",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Content Section
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title and Like Button Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: AppText(
                                  text: widget.product.title ?? '',
                                  textSize: 11,
                                  fontWeight: FontWeight.w600,
                                  maxLines: 2,
                                ),
                              ),
                              if (widget.product.discountPercentage != null &&
                                  widget.product.discountPercentage != 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.only(start: 8.w),
                                  child: LikeButtonDesign(
                                    onTapped: widget.onFavTapped,
                                    isLiked: widget.isLiked,
                                  ),
                                ),
                            ],
                          ),

                          // Rating
                          if (widget.product.averageRating != null)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: context.colorScheme.surfaceContainer,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppImage.asset(
                                    Assets.icons.starFilled,
                                    size: 12.sp,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: widget.product.averageRating!
                                        .toStringAsFixed(1),
                                    textSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: context.colorScheme.shadow,
                                  ),
                                ],
                              ),
                            ),

                          // Prices Row
                          Row(
                            children: [
                              // Sale Price
                              Row(
                                children: [
                                  AppText(
                                    text: widget.product.salePrice
                                            ?.toStringAsFixed(0) ??
                                        '0',
                                    textSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: context.colorScheme.primary,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: context.localizations.egp,
                                    textSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: context.colorScheme.shadow,
                                  ),
                                ],
                              ),
                              12.horizontalSpace,
                              // Old Price
                              if (widget.product.oldPrice != null &&
                                  widget.product.oldPrice != 0)
                                Row(
                                  children: [
                                    AppText(
                                      text: widget.product.oldPrice
                                              ?.toStringAsFixed(0) ??
                                          '0',
                                      textSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: context.colorScheme.shadow,
                                      textDecoration: TextDecoration.lineThrough,
                                    ),
                                    SizedBox(width: 2.w),
                                    AppText(
                                      text: context.localizations.egp,
                                      textSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: context.colorScheme.shadow,
                                      textDecoration: TextDecoration.lineThrough,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
