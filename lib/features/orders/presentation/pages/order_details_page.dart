import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/presentation/cubit/order_details_cubit.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/order_details_app_bar.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/order_product_list.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/order_status_timeline.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';
import '../widgets/order_details/confirm_cancel_dialog.dart';
import '../widgets/order_details/details_background.dart';
import '../widgets/order_details/order_details_info.dart';

@RoutePage()
class OrderDetailsPage extends StatefulWidget {
  final Orders order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late ScrollController _scrollController;
  double _headerOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _headerController.forward();
  }

  void _onScroll() {
    final offset = _scrollController.offset;
    final newOpacity = (1 - (offset / 150)).clamp(0.0, 1.0);
    if (newOpacity != _headerOpacity) {
      setState(() => _headerOpacity = newOpacity);
    }
  }

  @override
  void dispose() {
    _headerController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderDetailsCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            OrderDetailsBackground(),
            CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                OrderDetailsAppBar(orders: widget.order),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 200),
                    from: 30,
                    child: OrderDetailsInfo(orders: widget.order),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 300),
                    from: 30,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6.w),
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: context.colorScheme.primary.withValues(
                              alpha: 0.08,
                            ),
                            blurRadius: 30,
                            spreadRadius: 0,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: OrderStatusTimeline(
                        currentStatus: widget.order.status ?? OrderType.pending,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 400),
                    from: 20,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 16.h),
                      child: Row(
                        children: [
                          Container(
                            width: 4.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          12.horizontalSpace,
                          AppText.title(
                            text: context.localizations.products,
                            textSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: AppText(
                              text: '${widget.order.items?.length ?? 0}',
                              textSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                OrderProductList(
                  items: widget.order.items ?? [],
                  orderId: widget.order.id ?? 0,
                  orderStatus: widget.order.status,
                ),
                SliverToBoxAdapter(child: _buildOrderSummary(context)),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                if (widget.order.status == OrderType.pending)
                  BlocConsumer<OrderDetailsCubit, BaseState<String>>(
                    listener: (context, state) {
                      if (state.isSuccess) {
                        AppConstant.showCustomSnakeBar(
                          context,
                          state.data,
                          true,
                        );
                      }
                    },
                    builder: (context, state) {
                      return SliverPadding(
                        padding: screenPadding(),
                        sliver: SliverToBoxAdapter(
                          child: CustomButton(
                            backgroundColor: context.colorScheme.error,
                            text: context.localizations.cancelOrder,
                            press: () => ConfirmCancelOrderDialog.show(
                              context,
                              onConfirm: () {
                                context.read<OrderDetailsCubit>().cancelOrder(id: widget.order.id??0);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                SliverToBoxAdapter(child: SizedBox(height: 40.h)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummary(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      delay: const Duration(milliseconds: 600),
      from: 30,
      child: Container(
        margin: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 0),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.05),
              context.colorScheme.primary.withValues(alpha: 0.02),
            ],
          ),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
          ),
        ),
        child: Column(
          children: [
            // Title
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.receipt_outlined,
                    color: context.colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
                12.horizontalSpace,
                AppText.title(
                  text: context.localizations.invoice,
                  textSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            20.verticalSpace,
            // Subtotal
            _buildSummaryRow(
              context,
              title: context.localizations.total,
              value:
                  '${widget.order.subtotal?.toStringAsFixed(0) ?? '0'} ${context.localizations.egp}',
            ),
            12.verticalSpace,
            if ((widget.order.discountAmount ?? 0) > 0) ...[
              _buildSummaryRow(
                context,
                title: context.localizations.discount,
                value:
                    '-${widget.order.discountAmount?.toStringAsFixed(0) ?? '0'} ${context.localizations.egp}',
                valueColor: context.colorScheme.tertiary,
              ),
              12.verticalSpace,
            ],
            _buildSummaryRow(
              context,
              title: context.localizations.shippingCost,
              value: widget.order.shippingPrice != null && widget.order.shippingPrice != 0?
                  '${widget.order.shippingPrice?.toStringAsFixed(0) ?? '0'} ${context.localizations.egp}'
                  : context.localizations.freeDeleivery,
              valueColor: context.colorScheme.tertiary,
            ),
            16.verticalSpace,
            // Divider
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    context.colorScheme.primary.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            16.verticalSpace,
            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.title(
                  text: context.localizations.totalPrice,
                  textSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  children: [
                    AppText(
                      text: widget.order.total?.toStringAsFixed(0) ?? '0',
                      textSize: 16,
                      fontWeight: FontWeight.w800,
                      color: context.colorScheme.primary,
                    ),
                    8.horizontalSpace,
                    AppText(
                      text: context.localizations.egp,
                      textSize: 12,
                      fontWeight: FontWeight.w600,
                      color: context.colorScheme.primary.withValues(alpha: 0.7),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context, {
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText.body(
          text: title,
          textSize: 11,
          color: context.colorScheme.shadow,
        ),
        AppText(
          text: value,
          textSize: 11,
          fontWeight: FontWeight.w600,
          color: valueColor ?? context.colorScheme.onSurface,
        ),
      ],
    );
  }
}
