import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'order_status_bagde.dart';

class OrderItemCard extends StatelessWidget {
  final Orders order;
  final int index;

  const OrderItemCard({super.key, required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 400 + (index * 50).clamp(0, 300)),
      from: 20,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(3, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.receipt_long_rounded,
                        color: context.colorScheme.primary,
                        size: 17.sp,
                      ),
                    ),
                    12.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: '#${order.orderNumber ?? ''}',
                          textSize: 11,
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                        4.verticalSpace,
                        AppText.hint(
                          text: DateFormat.yMd().format(order.createdAt!),
                          textSize: 11,
                        ),
                      ],
                    ),
                  ],
                ),
                OrderStatusBadge(orderType: order.status),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 16.sp,
                  color: context.colorScheme.shadow,
                ),
                8.horizontalSpace,
                Expanded(
                  child: AppText.hint(
                    text: order.address ?? '',
                    maxLines: 2,
                    textSize: 10,
                  ),
                ),
                InkWell(
                  onTap: () =>
                      context.router.push(OrderDetailsRoute(order: order)),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colorScheme.primary,
                    ),
                    child: Row(
                      children: [
                        AppText(
                          text: context.localizations.details,
                          color: Colors.white,
                          textSize: 10,
                        ),
                        5.horizontalSpace,
                        AppImage.asset(
                          Assets.icons.arrowForward,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
