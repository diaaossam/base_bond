import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/response/prescription_order_model.dart';
import 'package:bond/features/orders/presentation/cubit/order_details_cubit.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/confirm_cancel_dialog.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/details_background.dart';
import 'package:bond/features/orders/presentation/widgets/order_details/order_status_timeline.dart';
import 'package:bond/features/orders/presentation/widgets/prescription_details/prescription_order_details_app_bar.dart';
import 'package:bond/features/orders/presentation/widgets/prescription_details/prescription_order_details_info.dart';
import 'package:bond/features/orders/presentation/widgets/prescription_details/prescription_image_viewer.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/dependencies/injectable_dependencies.dart';

@RoutePage()
class PrescriptionOrderDetailsPage extends StatefulWidget {
  final PrescriptionOrderModel order;

  const PrescriptionOrderDetailsPage({super.key, required this.order});

  @override
  State<PrescriptionOrderDetailsPage> createState() =>
      _PrescriptionOrderDetailsPageState();
}

class _PrescriptionOrderDetailsPageState
    extends State<PrescriptionOrderDetailsPage>
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
                PrescriptionOrderDetailsAppBar(order: widget.order),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 200),
                    from: 30,
                    child: PrescriptionOrderDetailsInfo(order: widget.order),
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
                            text: context.localizations.prescription,
                            textSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    delay: const Duration(milliseconds: 500),
                    from: 30,
                    child: PrescriptionImageViewer(
                      prescriptionImage: widget.order.prescriptionImage,
                    ),
                  ),
                ),
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
                                context
                                    .read<OrderDetailsCubit>()
                                    .cancelOrder(id: widget.order.id ?? 0);
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
}
