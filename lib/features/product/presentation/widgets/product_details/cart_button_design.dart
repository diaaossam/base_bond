import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../orders/presentation/cubit/cart/cart_cubit.dart';
import '../../cubit/details/product_details_cubit.dart';

class CartButtonDesign extends StatefulWidget {
  const CartButtonDesign({super.key});

  @override
  State<CartButtonDesign> createState() => _CartButtonDesignState();
}

class _CartButtonDesignState extends State<CartButtonDesign> {
  bool isExists = false;

  @override
  void initState() {
    context.read<CartCubit>().getCartData();
    super.initState();
  }

  String _generateUniqueProductId(CartItem item) {
    final productId = item.productId ?? item.productModel?.id ?? 0;
    final sizeId = item.sizeId ?? 0;
    final colorId = item.colorId ?? 0;
    return "${productId}_${sizeId}_${colorId}";
  }

  CartItem? _findProductInCart(
    List<CartItem> cartList,
    String uniqueProductId,
  ) {
    try {
      return cartList.firstWhere(
        (item) => item.uniqueProductId == uniqueProductId,
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, BaseState<CartStateData>>(
      builder: (context, cartState) {
        return BlocConsumer<ProductDetailsCubit, BaseState<CartItem>>(
          listener: (context, state) async {
            if (state.isSuccess && state.identifier == 'update_cart_item') {
              final cartItem = state.data;
              if (cartItem != null) {
                final uniqueProductId = _generateUniqueProductId(cartItem);
                final cartList = cartState.data?.cartList ?? [];
                final exists =
                    _findProductInCart(cartList, uniqueProductId) != null;
                setState(() => isExists = exists);
              }
            } else if (state.isSuccess &&
                state.identifier == 'init_cart_data') {
              final cartItem = state.data;
              if (cartItem != null) {
                final uniqueProductId = _generateUniqueProductId(cartItem);
                final cartList = cartState.data?.cartList ?? [];
                final exists =
                    _findProductInCart(cartList, uniqueProductId) != null;
                setState(() => isExists = exists);
              }
            } else if (state.isSuccess &&
                state.identifier == 'notify_product') {
              AppConstant.showCustomSnakeBar(
                context,
                'تم إرسال الإشعار بنجاح',
                true,
              );
            } else if (state.isFailure &&
                state.identifier == 'notify_product') {
              AppConstant.showCustomSnakeBar(
                context,
                state.error?.toString() ?? 'حدث خطأ',
                false,
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<ProductDetailsCubit>();
            final cartList = cartState.data?.cartList ?? [];

            if (state.isLoading && state.identifier == 'product_details') {
              return Padding(
                padding: screenPadding(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                      isLoading: true,
                      text: context.localizations.addToCart,
                      press: () {},
                      height: 45.h,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * .02),
                  ],
                ),
              );
            } else {
              final CartItem cartItem = state.data??CartItem();
              final uniqueProductId = _generateUniqueProductId(cartItem);
              final isExists = _findProductInCart(cartList, uniqueProductId) != null;
              return InkWell(
                onTap: () async {
                  if (isExists) {
                    final existingItem = _findProductInCart(
                      cartList,
                      uniqueProductId,
                    );
                    if (existingItem != null) {
                      num currentQtyInCart = existingItem.qty ?? 0;
                      num requestedQty = cartItem.qty ?? 1;
                      num availableStock = cartItem.stock ?? 0;
                      if (currentQtyInCart + requestedQty <= availableStock) {
                        context.read<CartCubit>().addToCart(cartItem);
                      } else {
                        AppConstant.showCustomSnakeBar(
                          context,
                          "${context.localizations.availableQuantity} ${availableStock - currentQtyInCart}",
                          false,
                        );
                      }
                    }
                  } else {
                    // منتج جديد - إضافة للسلة
                    context.read<CartCubit>().addToCart(cartItem);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.04,
                    vertical: SizeConfig.bodyHeight * .01,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                    vertical: SizeConfig.bodyHeight * .02,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      AppImage.asset(Assets.icons.shoppingCart,color: Colors.white,),
                      5.horizontalSpace,
                      Expanded(
                        child: AppText(
                          text: context.localizations.addToCart,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppText(
                        text: "${cartItem.price?.toStringAsFixed(2)} ${context.localizations.egp}",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
