import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/presentation/widgets/order_success_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/app_localizations_extension.dart';

class OrderHelper {
  Future<void> showSuccessOrderDialog({
    required BuildContext context,
    required Orders order,
  }) async {
    await OrderSuccessDialog.show(context: context, order: order);
  }

  String formatDateTime(DateTime dateTime) {
    final time =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    final date =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
    return "$time . $date";
  }

  ({Color color, IconData icon, String? label, String description})
  getStatusInfo(BuildContext context, OrderType ?status) {
    switch (status) {
      case OrderType.pending:
        return (
          color: Colors.orange,
          icon: Icons.hourglass_top_rounded,
          label: context.localizations.underReview,
          description: 'جاري مراجعة طلبك',
        );
      case OrderType.confirmed:
        return (
          color: Colors.blue,
          icon: Icons.check_circle_outline_rounded,
          label: context.localizations.confirmed,
          description: 'تم تأكيد طلبك وجاري تجهيزه',
        );
      case OrderType.inProgress:
        return (
          color: Colors.purple,
          icon: Icons.inventory_2_outlined,
          label: context.localizations.inProgress,
          description: 'جاري تجهيز طلبك',
        );
      case OrderType.outForDeleivery:
        return (
          color: Colors.teal,
          icon: Icons.local_shipping_outlined,
          label: context.localizations.outForDeleivery,
          description: 'طلبك في الطريق إليك',
        );
      case OrderType.delivered:
        return (
          color: Colors.green,
          icon: Icons.check_circle_rounded,
          label: context.localizations.deleiverd,
          description: 'تم توصيل طلبك بنجاح',
        );
      default:
        return (
          color: Colors.grey,
          icon: Icons.help_outline,
          label: '',
          description: '',
        );
    }
  }
}
