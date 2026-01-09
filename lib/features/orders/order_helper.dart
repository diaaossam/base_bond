import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/presentation/widgets/cart/parmacy_pickup/branch_selection_dialog.dart';
import 'package:bond/features/orders/presentation/widgets/order_success_dialog.dart';
import 'package:bond/features/orders/presentation/widgets/request_success_dialog.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/app_localizations_extension.dart';
import '../insurance_profile/presentation/cubit/branches/branches_cubit.dart';

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
  getStatusInfo(BuildContext context, OrderType? status) {
    switch (status) {
      case OrderType.pending:
        return (
          color: Colors.orange,
          icon: Icons.hourglass_top_rounded,
          label: context.localizations.underReview,
          description: context.localizations.underReview_desc,
        );
      case OrderType.confirmed:
        return (
          color: Colors.blue,
          icon: Icons.check_circle_outline_rounded,
          label: context.localizations.confirmed,
          description: context.localizations.confirmed_desc,
        );
      case OrderType.inProgress:
        return (
          color: Colors.purple,
          icon: Icons.inventory_2_outlined,
          label: context.localizations.inProgress,
          description: context.localizations.inProgress_desc,
        );
      case OrderType.outForDeleivery:
        return (
          color: Colors.teal,
          icon: Icons.local_shipping_outlined,
          label: context.localizations.outForDeleivery,
          description: context.localizations.inProgress_desc,
        );
      case OrderType.delivered:
        return (
          color: Colors.green,
          icon: Icons.check_circle_rounded,
          label: context.localizations.deleiverd,
          description: context.localizations.delivered_desc,
        );
      case OrderType.returns:
        return (
          color: Colors.yellow,
          icon: Icons.keyboard_return,
          label: context.localizations.returns,
          description: context.localizations.returns_desc,
        );
      case OrderType.canceled:
        return (
          color: Colors.red,
          icon: Icons.cancel,
          label: context.localizations.canceled,
          description: context.localizations.canceled_desc,
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

  void showBranchSelectionDialog({
    required BuildContext context,
    required BranchesCubit cubit,
    required BranchesModel? selectedBranch,
    required Function(BranchesModel)? onBranchSelected,
  }) async {
    final sortedBranches = await cubit.getBranchesSortedByDistance();

    if (sortedBranches.isEmpty) {
      return;
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BranchSelectionSheet(
        branches: sortedBranches,
        selectedBranch: selectedBranch,
        onBranchSelected: (branch) {
          if (onBranchSelected != null) {
            onBranchSelected(branch);
          }
          Navigator.pop(context);
        },
      ),
    );
  }

  Future<void> showSuccessPrescriptionOrderDialog({
    required BuildContext context,
  }) async {
    await PrescriptionSuccessDialog.show(context: context);
  }
}
