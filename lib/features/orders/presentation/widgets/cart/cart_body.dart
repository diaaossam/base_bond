import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
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
import 'payment_type.dart';
import 'price_cart_design.dart';

class CartBody extends StatefulWidget {
  const CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> with TickerProviderStateMixin {
  PaymentType paymentType = PaymentType.cash;
  TextEditingController note = TextEditingController();
  late AnimationController _staggerController;
  bool _animationsStarted = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    Future.microtask(() {
      context.read<CartCubit>().getCartData();
    });
  }

  void _initAnimations() {
    _staggerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  void _startAnimations() {
    if (!_animationsStarted) {
      _animationsStarted = true;
      _staggerController.forward();
    }
  }

  @override
  void dispose() {
    _staggerController.dispose();
    note.dispose();
    super.dispose();
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
        _startAnimations();

        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              _animationsStarted = false;
              _staggerController.reset();
              await bloc.getCartData();
              _staggerController.forward();
              _animationsStarted = true;
            },
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: 8.h,left: 10,right: 10),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: bloc.cartList.length,
                      (context, index) =>CartItemDesign(
                        onDelete: (p0) {
                          bloc.deleteItemFromCart(
                            id: p0.productId.toString(),
                          );
                        },
                        cartItem: bloc.cartList[index],
                      ),
                    ),
                  ),
                ),
                const DiscountDesign(),
                const CartLocationDesign(),
                PaymentTypeDesign(
                  payment: (p0) => setState(() => paymentType = p0),
                ),
                CartNoteDesign(note: note),
                SliverToBoxAdapter(child: SizedBox(height: 12.h)),
                const PriceCartDesign(),
                SliverToBoxAdapter(
                  child: _PlaceOrderButton(
                    isLoading:
                        state.isLoading && state.identifier == 'placeOrder',
                    onPressed: () => _handlePlaceOrder(bloc),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handlePlaceOrder(CartCubit bloc) {
/*    if (ApiConfig.isGuest == true) {
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
    );*/
  }
}


// Place Order Button with animation
class _PlaceOrderButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _PlaceOrderButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  State<_PlaceOrderButton> createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<_PlaceOrderButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: widget.isLoading ? 1.0 : _pulseAnimation.value,
          child: Padding(
            padding: screenPadding(),
            child: CustomButton(
              text: context.localizations.placeOrder,
              isLoading: widget.isLoading,
              press: widget.onPressed,
            ),
          ),
        );
      },
    );
  }
}
