import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/main_widget/app_text.dart';
import '../../../order_helper.dart';

class StatusBadgeDesign extends StatelessWidget {
  final Orders orders;

  const StatusBadgeDesign({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    final statusInfo = OrderHelper().getStatusInfo(context, orders.status);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: statusInfo.color,
              shape: BoxShape.circle,
            ),
          ),
          8.horizontalSpace,
          AppText(
            text: statusInfo.label ?? "",
            textSize: 11,
            fontWeight: FontWeight.w600,
            color: statusInfo.color,
          ),
        ],
      ),
    );
  }
}
