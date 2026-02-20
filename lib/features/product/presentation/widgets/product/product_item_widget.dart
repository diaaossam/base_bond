import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/product_model.dart';
import 'like_button.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductModel product;
  final int index;
  final double? width;
  final bool isLiked;
  final Function(bool) onFavTapped;

  const ProductItemWidget({
    super.key,
    required this.product,
    required this.index,
    this.width,
    required this.isLiked,
    required this.onFavTapped,
  });

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }

  void _onQuickAddToCart(BuildContext context) {
    if (ApiConfig.isGuest == true) {
      SettingsHelper().showGuestDialog(context);
      return;
    }
    final stock = num.tryParse(widget.product.currentStock ?? '0') ?? 0;
    if (stock <= 0) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.notifyWhenAvailable,
        false,
      );
      return;
    }
    final cartItem = CartItem(
      productId: widget.product.id,
      qty: 1,
      price: widget.product.salePrice ?? 0,
      stock: stock,
      currentItemPrice: widget.product.salePrice ?? 0,
      productModel: widget.product,
    );
    context.read<CartCubit>().addToCart(cartItem);
    AppConstant.showCustomSnakeBar(
      context,
      context.localizations.productAddedToCartSuccess,
      true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _hoverController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: () => context.router.push(
              ProductDetailsRoute(product: widget.product),
            ),
            child: Container(
              width: widget.width ?? 170.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                border: Border.all(width: 2,color: context.colorScheme.outline),
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 12,
                    spreadRadius: 0,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r),
                            ),
                            child:
                                widget.product.featureImage == null ||
                                    widget.product.featureImage!.isEmpty
                                ? AppImage.asset(
                                    Assets.images.logo.path,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  )
                                : AppImage.network(
                                    remoteImage:
                                        widget.product.featureImage ?? '',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                          ),
                          if (widget.product.discountPercentage != null &&
                              widget.product.discountPercentage != 0)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.h,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colorScheme.error,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                      start: Radius.circular(20),
                                    ),
                              ),
                              child: Center(
                                child: Text(
                                  "- ${widget.product.discountPercentage.toString()} %",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: widget.product.title ?? '',
                            textSize: 9,
                            maxLines: 2,
                          ),
                          5.verticalSpace,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  AppText(
                                    text:
                                        widget.product.salePrice
                                            ?.toStringAsFixed(0) ??
                                        '0',
                                    textSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: context.colorScheme.primary,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: context.localizations.egp,
                                    textSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: context.colorScheme.shadow,
                                  ),
                                ],
                              ),
                              10.horizontalSpace,
                              Row(
                                children: [
                                  AppText(
                                    text:
                                        widget.product.oldPrice
                                            ?.toStringAsFixed(0) ??
                                        '0',
                                    textSize: 10,
                                    fontWeight: FontWeight.w700,
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
                              10.horizontalSpace,
                              if (widget.product.averageRating != null)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppImage.asset(
                                      Assets.icons.starFilled,
                                      size: 12.sp,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(width: 2.w),
                                    AppText(
                                      text: widget.product.averageRating!
                                          .toStringAsFixed(1),
                                      textSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: context.colorScheme.shadow,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          5.verticalSpace,
                          Spacer(),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocBuilder<CartCubit, BaseState<CartStateData>>(
                                builder: (context, cartState) {
                                  final cartList = cartState.data?.cartList ?? [];
                                  final isInCart = cartList.any(
                                    (item) =>
                                        item.productId.toString() ==
                                        widget.product.id.toString(),
                                  );
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () => _onQuickAddToCart(context),
                                      behavior: HitTestBehavior.opaque,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5.h),
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                        child: Center(child: AppText(text: context.localizations.addToCart,color: Colors.white,textSize: 9,)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 6.w),
                              LikeButtonDesign(
                                onTapped: widget.onFavTapped,
                                isLiked: widget.isLiked,
                                size: 28,
                                padding: 4,
                              ),
                            ],
                          ),
                          10.verticalSpace,
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
