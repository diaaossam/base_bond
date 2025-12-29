import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/location/presentation/cubit/my_address/my_address_cubit.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enum/payment_type.dart';
import '../../../../../core/utils/api_config.dart';
import '../../../../location/data/models/response/my_address.dart';
import '../../../../settings/presentation/widgets/settings_helper.dart';
import '../../../data/models/request/cart_params.dart';
import '../../../data/models/response/orders.dart';
import 'cart_item_design.dart';
import 'cart_location_design.dart';
import 'cart_note_design.dart';
import 'discount_design.dart';
import 'empty_cart_design.dart';
import 'payment_type.dart';
import 'price_cart_design.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> with TickerProviderStateMixin {
  PaymentType paymentType = PaymentType.cash;
  TextEditingController note = .new();

  MyAddress? defaultAddress;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CartCubit>().getCartData();
      defaultAddress = CommonCaching.defaultAddress;
    });
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
            order: state.data?.orders ?? Orders(),
          );
        }
      },
      builder: (context, state) {
        final bloc = context.read<CartCubit>();
        if (state.isLoading) {
          return const LoadingWidget();
        }
        if (bloc.cartList.isEmpty) {
          return const EmptyCartDesign();
        }
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async => await bloc.getCartData(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 8.h, left: 10, right: 10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: bloc.cartList.length,
                      (context, index) => CartItemDesign(
                        onDelete: (p0) {
                          bloc.deleteItemFromCart(id: p0.productId.toString());
                        },
                        cartItem: bloc.cartList[index],
                      ),
                    ),
                  ),
                ),
                const DiscountDesign(),
                CartLocationDesign(defaultAddress: defaultAddress,onAddressChanged: (data) =>setState(() {
                  defaultAddress = data;
                }),),
                PaymentTypeDesign(
                  payment: (p0) => setState(() => paymentType = p0),
                ),
                CartNoteDesign(note: note),
                SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                PriceCartDesign(myAddress: defaultAddress,),
                SliverPadding(
                  padding: screenPadding(),
                  sliver: SliverToBoxAdapter(
                    child: CustomButton(
                      text: context.localizations.placeOrder,
                      press: () {
                        if (ApiConfig.isGuest == true) {
                          SettingsHelper().showGuestDialog(
                            context,
                            isFromCart: true,
                          );
                          return;
                        }
                        bloc.placeOrder(
                          cart: CartParams(
                            pointsId: bloc.availablePoints?.id,
                            discountCode: bloc.couponCode,
                            note: note.text,
                            addressId: defaultAddress?.id,
                            items: bloc.cartList,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
