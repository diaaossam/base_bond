import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/info_row_design.dart';

class OrderDetailsInfo extends StatelessWidget {
  final Orders orders;

  const OrderDetailsInfo({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.08),
            blurRadius: 30,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          if (orders.address != null) ...[
            InfoRowDesign(
              icon: Icons.location_on_outlined,
              title: context.localizations.address,
              value: orders.address ?? '',
            ),
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          ],
          if (orders.notes != null && orders.notes!.isNotEmpty) ...[
            InfoRowDesign(
              icon: Icons.note_alt_outlined,
              title: context.localizations.addNote,
              value: orders.notes ?? '',
            ),
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          ],
          InfoRowDesign(
            icon: Icons.payment_outlined,
            title: context.localizations.paymentType,
            value: context.localizations.cash,
          ),
          Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          InfoRowDesign(
            icon: Icons.car_crash_outlined,
            title: context.localizations.deliveryMethod,
            value: orders.addressData == null
                ? context.localizations.pharmacyPickup
                : context.localizations.homeDelivery,
          ),
        ],
      ),
    );
  }
}
