import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
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
    return BlocConsumer<CartCubit, BaseState<CartStateData>>(
      listener: (context, state) {
        if (state.isSuccess && state.identifier == "cart") {
          checkIfProductInCart(carts: state.data!.cartList);
        }
      },
      builder: (context, cartState) {
        return BlocBuilder<ProductDetailsCubit, BaseState<CartItem>>(
          builder: (context, state) {
            if (isExists) {
              return QuantityDesign(
                isCart: false,
                key: ValueKey(state.data?.productModel?.id),
                isActive: (state.data?.qty ?? 0) > 0,
                stock: state.data?.stock,
                callback: (info) {
                  CartItem? cartItem = state.data?.copyWith(
                    qty: info['count'],
                    price: info['count'] * state.data?.currentItemPrice,
                  );
                  context.read<ProductDetailsCubit>().updateCartItem(
                    item: cartItem ?? CartItem(),
                  );
                },
              );
            } else {
              final CartItem cartItem = state.data ?? CartItem();
              return InkWell(
                onTap: () async =>
                    context.read<CartCubit>().addToCart(cartItem),
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

  void checkIfProductInCart({required List<CartItem> carts}) {
    var contain = carts.where((element) {
      return element.uniqueProductId.toString() ==
          widget.productModel.id.toString();
    }).toList();
    setState(() => isExists = contain.isNotEmpty);
  }
}
