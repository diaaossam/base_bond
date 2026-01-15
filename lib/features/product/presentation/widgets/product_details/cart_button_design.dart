import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/presentation/widgets/product_details/quantity_design.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../orders/presentation/cubit/cart/cart_cubit.dart';
import '../../cubit/details/product_details_cubit.dart';

class CartButtonDesign extends StatefulWidget {
  final ProductModel productModel;

  const CartButtonDesign({super.key, required this.productModel});

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, BaseState<CartItem>>(
      builder: (context, state) {
        return BlocConsumer<CartCubit, BaseState<CartStateData>>(
          listener: (context, cartState) {
            if (cartState.isSuccess && cartState.identifier == "cart") {
              final data = checkIfProductInCart(
                carts: cartState.data!.cartList,
              );
              if (data != null) {
                context.read<ProductDetailsCubit>().updateCartItem(item: data);
              }
            }
          },
          builder: (context, cartState) {
            if (isExists) {
              return QuantityDesign(
                isCart: false,
                key: ValueKey(state.data?.productModel?.id),
                isActive: (state.data?.qty ?? 0) > 0,
                count: state.data!.qty!.toInt(),
                stock: state.data?.stock,
                callback: (info) {
                  if (info['isIncrease'] == false && info['count'] == 0) {
                    context.read<CartCubit>().deleteItemFromCart(
                      id: widget.productModel.id.toString(),
                    );
                    context.read<ProductDetailsCubit>().initCartData(
                      productModel: widget.productModel,
                    );
                    setState(() => isExists = false);
                    return;
                  }
                  context.read<CartCubit>().setQuantity(
                    productId: widget.productModel.id.toString(),
                    isIncrease: info['isIncrease'],
                  );
                },
              );
            } else {
              final CartItem cartItem = state.data ?? CartItem();
              final bool isOutOfStock = (cartItem.stock ?? 0) <= 0;

              // Show "Notify me when available" button if out of stock
              if (isOutOfStock) {
                return BlocListener<ProductDetailsCubit, BaseState<CartItem>>(
                  listenWhen: (previous, current) =>
                      current.identifier == 'notify_when_available',
                  listener: (context, state) {
                    if (state.isSuccess) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        context.localizations.notifyWhenAvailableSuccess,
                        true,
                      );
                    } else if (state.isFailure) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        state.error ?? context.localizations.somethingWentWrong,
                        false,
                      );
                    }
                  },
                  child: InkWell(
                    onTap: () {
                      context.read<ProductDetailsCubit>().notifyWhenAvailable(
                        productId: widget.productModel.id ?? 0,
                      );
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
                        color: context.colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_active_outlined,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          8.horizontalSpace,
                          Flexible(
                            child: AppText(
                              text: context.localizations.notifyWhenAvailable,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return InkWell(
                onTap: () async {
                  setState(() => isExists = true);
                  return context.read<CartCubit>().addToCart(cartItem);
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
                      AppImage.asset(
                        Assets.icons.shoppingCart,
                        color: Colors.white,
                      ),
                      5.horizontalSpace,
                      Expanded(
                        child: AppText(
                          text: context.localizations.addToCart,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AppText(
                        text:
                            "${cartItem.price?.toStringAsFixed(2)} ${context.localizations.egp}",
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

  CartItem? checkIfProductInCart({required List<CartItem> carts}) {
    var contain = carts.where((element) {
      return element.productId.toString() == widget.productModel.id.toString();
    }).toList();
    setState(() => isExists = contain.isNotEmpty);
    if (isExists) {
      return contain.first;
    }
    return null;
  }
}
