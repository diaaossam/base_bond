import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/product/presentation/widgets/product_details/quantity_design.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemDesign extends StatefulWidget {
  final CartItem cartItem;
  final Function(CartItem) onDelete;

  const CartItemDesign({
    super.key,
    required this.cartItem,
    required this.onDelete,
  });

  @override
  State<CartItemDesign> createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, BaseState<CartStateData>>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: Offset(0, 2 + 1),
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: AppImage.network(
                      height: SizeConfig.bodyHeight * .12,
                      width: SizeConfig.screenWidth * .25,
                      remoteImage:
                          widget.cartItem.productModel?.images?.isNotEmpty == true
                          ? widget.cartItem.productModel!.images![0]
                          : widget.cartItem.productModel?.featureImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  14.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: widget.cartItem.productModel?.title ?? "",
                          textSize: 12,
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                          color: context.colorScheme.onSurface,
                        ),
                        8.verticalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                context.colorScheme.tertiary.withValues(
                                  alpha: 0.15,
                                ),
                                context.colorScheme.tertiary.withValues(
                                  alpha: 0.08,
                                ),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: AppText(
                            text:
                            "${widget.cartItem.price?.toStringAsFixed(0)} ${context.localizations.egp}",
                            fontWeight: FontWeight.w700,
                            textSize: 12,
                            color: context.colorScheme.tertiary,
                          ),
                        ),
                        12.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            QuantityDesign(
                              key: ValueKey(
                                '${widget.cartItem.productModel?.id}',
                              ),
                              isCart: true,
                              count: widget.cartItem.qty!.toInt(),
                              stock: widget.cartItem.stock,
                              callback: (info) {
                                if (info['count'] == 0) {
                                  widget.onDelete(widget.cartItem);
                                } else {
                                  context.read<CartCubit>().setQuantity(
                                    productId: widget.cartItem.productId
                                        .toString(),
                                    isIncrease: info['isIncrease'],
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
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
