import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/product/presentation/widgets/product_details/quantity_design.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemDesign extends StatelessWidget {
  final CartItem cartItem;
  final Function(CartItem) onDelete;

  const CartItemDesign({
    super.key,
    required this.cartItem,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, BaseState<CartStateData>>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .02,
            vertical: SizeConfig.bodyHeight * .02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.bodyHeight * 0.02),
                    AppText(
                      text: cartItem.productModel?.title ?? "",
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: SizeConfig.bodyHeight * 0.01),
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            text:
                                "${((cartItem.currentItemPrice ?? cartItem.price ?? 1) * (cartItem.qty ?? 1)).toStringAsFixed(2)} ${context.localizations.iqd}",
                            fontWeight: FontWeight.w600,
                            textSize: 14,
                          ),
                        ),
                        if (cartItem.stock == 0)
                          InkWell(
                            onTap: () => onDelete(cartItem),
                            child: Row(
                              children: [
                                AppImage.asset(Assets.icons.trash),
                                SizedBox(width: 10.w),
                                AppText(
                                  text: context.localizations.outOfStock,
                                  color: context.colorScheme.error,
                                ),
                              ],
                            ),
                          )
                        else
                          QuantityDesign(
                            key: ValueKey('${cartItem.productModel?.id}'),
                            isCart: true,
                            count: cartItem.qty!.toInt(),
                            stock: cartItem.stock,
                            callback: (info) {
                                       if (info['count'] == 0) {
                                onDelete(cartItem);
                              } else {
                                context.read<CartCubit>().setQuantity(
                                  productId: cartItem.productId.toString(),
                                  isIncrease: info['isIncrease'],
                                );
                              }
                            },
                          ),
                        SizedBox(width: SizeConfig.screenWidth * .06),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AppImage.network(
                  height: SizeConfig.bodyHeight * .12,
                  width: SizeConfig.screenWidth * .25,
                  remoteImage: cartItem.productModel?.images?.isNotEmpty == true
                      ? cartItem.productModel!.images![0]
                      : cartItem.productModel?.featureImage,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
