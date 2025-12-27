import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PriceCartDesign extends StatelessWidget {
  const PriceCartDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Center());
    /*return BlocBuilder<CartCubit, BaseState<CartStateData>>(
      builder: (context, state) {
        final bloc = context.read<CartCubit>();
        final formatter = NumberFormat.decimalPatternDigits();
        final colorScheme = context.colorScheme;

        return SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // Decorative gradient corner
                  Positioned(
                    right: -30,
                    top: -30,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            colorScheme.tertiary.withOpacity(0.15),
                            colorScheme.tertiary.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(18.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: colorScheme.tertiary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.receipt_long_rounded,
                                color: colorScheme.tertiary,
                                size: 22,
                              ),
                            ),
                            12.horizontalSpace,
                            AppText(
                              text: context.localizations.invoice,
                              fontWeight: FontWeight.w700,
                              textSize: 16,
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),

                        // Divider
                        Container(
                          height: 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.outline.withOpacity(0),
                                colorScheme.outline,
                                colorScheme.outline.withOpacity(0),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Price rows
                        _PriceRow(
                          label: context.localizations.total,
                          value:
                              "${formatter.format(bloc.amount.toInt())} ${context.localizations.iqd}",
                        ),

                        if (ApiConfig.address != null) ...[
                          SizedBox(height: 12.h),
                          _PriceRow(
                            label: context.localizations.shippingCost,
                            value:
                                "${formatter.format(ApiConfig.address?.governorate?.deliveryPrice ?? 0)} ${context.localizations.iqd}",
                            icon: Icons.local_shipping_outlined,
                          ),
                        ],

                        if (bloc.couponDiscount != 0) ...[
                          SizedBox(height: 12.h),
                          _PriceRow(
                            label: context.localizations.discount,
                            value:
                                "- ${formatter.format(bloc.couponDiscount.toInt())} ${context.localizations.iqd}",
                            isDiscount: true,
                            icon: Icons.local_offer_outlined,
                          ),
                        ],

                        if (bloc.pointDiscount != 0) ...[
                          SizedBox(height: 12.h),
                          _PriceRow(
                            label: context.localizations.discount,
                            value:
                                "- ${formatter.format(bloc.pointDiscount.toInt())} ${context.localizations.iqd}",
                            isDiscount: true,
                            icon: Icons.star_outline_rounded,
                          ),
                        ],

                        if (bloc.isFreeDeleivery && ApiConfig.address?.governorate?.deliveryPrice != null) ...[
                          SizedBox(height: 12.h),
                          _PriceRow(
                            label: context.localizations.freeDeleivery,
                            value:
                                "- ${formatter.format(ApiConfig.address?.governorate?.deliveryPrice ?? 0)} ${context.localizations.iqd}",
                            isDiscount: true,
                            icon: Icons.celebration_outlined,
                          ),
                        ],

                        SizedBox(height: 16.h),

                        // Final divider with dots
                        Row(
                          children: List.generate(
                            30,
                            (index) => Expanded(
                              child: Container(
                                height: 2,
                                margin: EdgeInsets.symmetric(horizontal: 2.w),
                                decoration: BoxDecoration(
                                  color: colorScheme.outline,
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        // Total Price - Highlighted
                        _TotalPriceWidget(
                          label: context.localizations.totalPrice,
                          value: _setUpPrice(
                            amount: bloc.amount,
                            context: context,
                            isFreeDeleivery: bloc.isFreeDeleivery,
                            couponDiscount: bloc.couponDiscount,
                            pointDiscount: bloc.pointDiscount,
                            deleivery: (ApiConfig
                                    .address?.governorate?.deliveryPrice ??
                                0),
                          ),
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
    );*/
  }

  String _setUpPrice({
    required num amount,
    required num deleivery,
    required BuildContext context,
    required num couponDiscount,
    required num pointDiscount,
    required bool isFreeDeleivery,
  }) {
    final formatter = NumberFormat.decimalPatternDigits();

    final total = (amount +
            deleivery -
            couponDiscount -
            pointDiscount -
            (isFreeDeleivery ? deleivery : 0))
        .toStringAsFixed(2);

    return "${formatter.format(num.parse(total))} ${context.localizations.iqd}";
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isDiscount;
  final IconData? icon;

  const _PriceRow({
    required this.label,
    required this.value,
    this.isDiscount = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Row(
      children: [
        if (icon != null) ...[
          Icon(
            icon,
            size: 18,
            color: isDiscount ? colorScheme.error : colorScheme.shadow,
          ),
          8.horizontalSpace,
        ],
        Expanded(
          child: AppText(
            text: label,
            textSize: 13,
            color: isDiscount ? colorScheme.error : colorScheme.shadow,
          ),
        ),
        AppText(
          text: value,
          fontWeight: FontWeight.w600,
          textSize: 13,
          color: isDiscount ? colorScheme.error : colorScheme.onSurface,
        ),
      ],
    );
  }
}

class _TotalPriceWidget extends StatefulWidget {
  final String label;
  final String value;

  const _TotalPriceWidget({
    required this.label,
    required this.value,
  });

  @override
  State<_TotalPriceWidget> createState() => _TotalPriceWidgetState();
}

class _TotalPriceWidgetState extends State<_TotalPriceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(_TotalPriceWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  colorScheme.tertiary.withOpacity(0.15),
                  colorScheme.tertiary.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: colorScheme.tertiary.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_bag_rounded,
                  color: colorScheme.tertiary,
                  size: 24,
                ),
                12.horizontalSpace,
                Expanded(
                  child: AppText(
                    text: widget.label,
                    fontWeight: FontWeight.w700,
                    textSize: 15,
                    color: colorScheme.tertiary,
                  ),
                ),
                AppText(
                  text: widget.value,
                  fontWeight: FontWeight.w800,
                  textSize: 16,
                  color: colorScheme.tertiary,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
