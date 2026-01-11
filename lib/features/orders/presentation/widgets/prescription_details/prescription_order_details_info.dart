import 'package:bond/features/orders/data/models/response/prescription_order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/info_row_design.dart';

class PrescriptionOrderDetailsInfo extends StatelessWidget {
  final PrescriptionOrderModel order;

  const PrescriptionOrderDetailsInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    // تحديد العنوان بناءً على نوع التوصيل
    String? displayAddress;
    IconData addressIcon = Icons.location_on_outlined;
    String addressTitle = context.localizations.address;

    if (order.pharmacyBranch != null) {
      // إذا كان هناك فرع صيدلية (استلام من الصيدلية)
      displayAddress = order.pharmacyBranch?.address ?? order.pharmacyBranch?.title;
      addressIcon = Icons.store_outlined;
      addressTitle = context.localizations.pharmacyAddress;
    } else if (order.address != null) {
      // إذا كان هناك عنوان منزل (توصيل للمنزل)
      displayAddress = order.address?.address ?? 
                      '${order.address?.streetAddress ?? ''} ${order.address?.city?.title ?? ''} ${order.address?.governorate?.title ?? ''}'.trim();
    }

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
          if (displayAddress != null && displayAddress.isNotEmpty) ...[
            InfoRowDesign(
              icon: addressIcon,
              title: addressTitle,
              value: displayAddress,
            ),
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          ],
          if (order.deliveryWay != null && order.deliveryWay!.isNotEmpty) ...[
            InfoRowDesign(
              icon: Icons.local_shipping_outlined,
              title: context.localizations.deliveryMethod,
              value: order.deliveryWay ?? '',
            ),
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          ],
          if (order.notes != null && order.notes!.isNotEmpty) ...[
            InfoRowDesign(
              icon: Icons.note_alt_outlined,
              title: context.localizations.addNote,
              value: order.notes ?? '',
            ),
            Divider(color: context.colorScheme.outline.withValues(alpha: 0.3)),
          ],
          InfoRowDesign(
            icon: Icons.payment_outlined,
            title: context.localizations.paymentType,
            value: order.paymentMethod ?? context.localizations.cash,
          ),
        ],
      ),
    );
  }
}
