import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/features/orders/data/models/response/prescription_order_model.dart';
import 'package:bond/features/orders/presentation/widgets/prescription_details/prescription_status_badge_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../order_helper.dart';

class PrescriptionOrderDetailsAppBar extends StatelessWidget {
  final PrescriptionOrderModel order;

  const PrescriptionOrderDetailsAppBar({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160.h,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: FadeIn(
        duration: const Duration(milliseconds: 400),
        child: GestureDetector(
          onTap: () => context.router.maybePop(),
          child: Container(
            margin: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        color: Colors.white,
                        size: 17.sp,
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.localizations.prescription,
                            textSize: 11,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                          4.verticalSpace,
                          AppText(
                            text: '#${order.orderNumber ?? ''}',
                            textSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    PrescriptionStatusBadgeDesign(order: order),
                  ],
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.white.withValues(alpha: 0.8),
                      size: 16.sp,
                    ),
                    8.horizontalSpace,
                    AppText(
                      text: order.createdAt != null
                          ? OrderHelper().formatDateTime(order.createdAt!)
                          : '',
                      textSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
