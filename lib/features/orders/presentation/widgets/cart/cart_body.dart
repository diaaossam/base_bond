import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/widget_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enum/payment_type.dart';
import 'cart_item_design.dart';
import 'cart_location_design.dart';
import 'cart_note_design.dart';
import 'discount_design.dart';
import 'empty_cart_design.dart';
import 'gift_cart_design.dart';
import 'payment_type.dart';
import 'price_cart_design.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  PaymentType? paymentType;
  TextEditingController note = TextEditingController();

  @override
  void initState() {
    Future.microtask(() => context.read<CartCubit>().getCartData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, BaseState<CartStateData>>(
      listener: (context, state) {
        if (state.isFailure) {
          AppConstant.showCustomSnakeBar(
            context,
            state.error.toString(),
            false,
          );
        } else if (state.isSuccess && state.identifier == "placeOrder") {
          context.read<CartCubit>().clearCartOptimistically();
          OrderHelper().showSuccessOrderDialog(
            context: context,
            id: state.data?.orderId ?? 0,
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<CartCubit>();
        if (state.isLoading && state.identifier == 'cart') {
          return const LoadingWidget();
        }
        if (bloc.cartList.isEmpty) {
          return const EmptyCartDesign();
        }
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => bloc.getCartData(),
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: bloc.cartList.length,
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CartItemDesign(
                        onDelete: (p0) {
                          bloc.deleteItemFromCart(
                            id: p0.uniqueProductId.toString(),
                          );
                        },
                        cartItem: bloc.cartList[index],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                const DiscountDesign(),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                const CartLocationDesign(),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                PaymentTypeDesign(
                  payment: (p0) => setState(() => paymentType = p0),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                CartNoteDesign(note: note),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                const GiftCartDesign(),
                SliverToBoxAdapter(child: SizedBox(height: 15.h)),
                const PriceCartDesign(),
                SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                CustomButton(
                  text: context.localizations.placeOrder,
                  isLoading:
                      state.isLoading && state.identifier == 'placeOrder',
                  press: () {
                    if (ApiConfig.isGuest == true) {
                      SettingsHelper().showGuestDialog(
                        context,
                        isFromCart: true,
                      );
                      return;
                    }
                    if (ApiConfig.address == null) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        context.localizations.locationValidation,
                        false,
                      );
                      return;
                    }
                    if (paymentType == null) {
                      AppConstant.showCustomSnakeBar(
                        context,
                        context.localizations.paymentValidation,
                        false,
                      );
                      return;
                    }
                    for (var element in bloc.cartList) {
                      if (element.stock == 0) {
                        AppConstant.showCustomSnakeBar(
                          context,
                          context.localizations.outOfStock1,
                          false,
                        );
                        return;
                      }
                    }
                    OrderHelper().showConfirmOrderDialog(
                      context: context,
                      onReceive: (p0) {
                        if (p0) {
                          bloc.placeOrder(
                            cart: CartParams(
                              pointsId: bloc.availablePoints?.id,
                              discountCode: bloc.couponCode,
                              note: note.text,
                              addressId: ApiConfig.address?.id,
                              items: bloc.cartList,
                            ),
                          );
                        }
                      },
                    );
                  },
                ).toSliverPadding(padding: screenPadding()),
                SliverToBoxAdapter(child: SizedBox(height: 40.h)),
              ],
            ),
          ),
        );
      },
    );
  }
}
