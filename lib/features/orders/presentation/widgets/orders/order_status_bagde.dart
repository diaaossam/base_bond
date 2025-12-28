import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/enum/order_type.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../order_helper.dart';

class OrderStatusBadge extends StatelessWidget {
  final OrderType? orderType;

  const OrderStatusBadge({super.key, this.orderType});

  @override
  Widget build(BuildContext context) {
    final statusInfo = OrderHelper().getStatusInfo(context, orderType);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            statusInfo.color.withValues(alpha: 0.2),
            statusInfo.color.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: statusInfo.color.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(
              color: statusInfo.color,
              shape: BoxShape.circle,
            ),
          ),
          6.horizontalSpace,
          AppText(
            text: statusInfo.label ?? '',
            textSize: 9,
            fontWeight: FontWeight.w600,
            color: statusInfo.color,
          ),
        ],
      ),
    );
  }
}
