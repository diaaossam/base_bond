import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:bond/features/location/presentation/widgets/delete_confirmation_design.dart';
import 'package:flutter/material.dart';

import '../../config/dependencies/injectable_dependencies.dart';
import '../../core/services/location/global_location_service.dart';

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

  Future<double?> calculateDistance({required BranchesModel branch}) async {
    if (branch.latitude == null || branch.longitude == null) {
      return null;
    }

    try {
      final locationService = sl<GlobalLocationService>();
      final currentLocation = await locationService.getCurrentLocation();
      if (currentLocation == null) {
        return null;
      }

      return locationService.calculateDistance(
        currentLocation.latitude,
        currentLocation.longitude,
        branch.latitude!,
        branch.longitude!,
      );
    } catch (e) {
      return null;
    }
  }
}
