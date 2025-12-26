import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:bond/features/location/presentation/widgets/delete_confirmation_design.dart';
import 'package:flutter/material.dart';

class LocationHelper {
  Future<bool> showDelete({
    required BuildContext context,
    required MyAddress address,
  }) async {
    final response = await showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => DeleteConfirmationSheet(
        address: address,
        onConfirm: () => Navigator.pop(context, true),
        onCancel: () => Navigator.pop(context, false),
      ),
    );
    return response ?? false;
  }
}
