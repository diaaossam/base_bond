import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/core/services/location/global_location_service.dart';
import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/features/app/data/repositories/app_repository.dart';
import 'package:injectable/injectable.dart';

import 'branches_data_state.dart';

@Injectable()
class BranchesCubit extends Cubit<BaseState<BranchesDataState>>
    with AsyncHandler<BranchesDataState> {
  final AppRepositoryImpl appRepositoryImpl;
  final GlobalLocationService locationService;

  BranchesCubit(this.appRepositoryImpl, this.locationService)
      : super(BaseState.initial(
          data: const BranchesDataState(),
        ));

  BranchesDataState get _data => state.data ?? const BranchesDataState();

  /// Load all branches
  Future<void> loadAllBranches() async {
    await handleAsync(
      identifier: 'branches',
      call: () => appRepositoryImpl.getBranches(),
      onSuccess: (branches) => _data.copyWith(branches: branches),
    );
  }

  /// Get the nearest branch to current location
  /// 
  /// This method will:
  /// 1. Request location permission if needed
  /// 2. Get current location
  /// 3. Calculate distances to all branches
  /// 4. Return the nearest branch
  /// 
  /// Returns the nearest branch or null if location/permission denied
  Future<BranchesModel?> getNearestBranch() async {
    try {
      if (_data.branches == null || _data.branches!.isEmpty) {
        await loadAllBranches();
      }

      final branches = _data.branches;
      if (branches == null || branches.isEmpty) {
        return null;
      }

      // Get current location
      final currentLocation = await locationService.getCurrentLocation();
      if (currentLocation == null) {
        return null;
      }

      // Find nearest branch
      BranchesModel? nearestBranch;
      double minDistance = double.infinity;

      for (final branch in branches) {
        if (branch.latitude == null || branch.longitude == null) {
          continue;
        }

        final distance = locationService.calculateDistance(
          currentLocation.latitude,
          currentLocation.longitude,
          branch.latitude!,
          branch.longitude!,
        );

        if (distance < minDistance) {
          minDistance = distance;
          nearestBranch = branch;
        }
      }

      // Update state with nearest branch
      if (nearestBranch != null) {
        emit(
          state.copyWith(
            data: _data.copyWith(nearestBranch: nearestBranch),
          ),
        );
      }

      return nearestBranch;
    } catch (e) {
      return null;
    }
  }

  /// Get nearest branch and update state
  /// 
  /// This is a convenience method that loads branches if needed,
  /// gets the nearest one, and updates the state
  Future<void> findAndSetNearestBranch() async {
    // Load branches if not loaded
    if (_data.branches == null || _data.branches!.isEmpty) {
      await loadAllBranches();
    }

    // Get nearest branch
    final nearestBranch = await getNearestBranch();
    
    if (nearestBranch != null) {
      emit(
        state.copyWith(
          data: _data.copyWith(nearestBranch: nearestBranch),
        ),
      );
    }
  }

  /// Get all branches sorted by distance from current location
  /// 
  /// Returns list of branches sorted from nearest to farthest
  Future<List<BranchesModel>> getBranchesSortedByDistance() async {
    try {
      // Ensure branches are loaded
      if (_data.branches == null || _data.branches!.isEmpty) {
        await loadAllBranches();
      }

      final branches = _data.branches;
      if (branches == null || branches.isEmpty) {
        return [];
      }

      // Get current location
      final currentLocation = await locationService.getCurrentLocation();
      if (currentLocation == null) {
        // If no location, return branches as-is
        return branches;
      }

      // Create list with distances
      final branchesWithDistance = branches
          .where((branch) =>
              branch.latitude != null && branch.longitude != null)
          .map((branch) {
        final distance = locationService.calculateDistance(
          currentLocation.latitude,
          currentLocation.longitude,
          branch.latitude!,
          branch.longitude!,
        );
        return MapEntry(branch, distance);
      }).toList();

      // Sort by distance
      branchesWithDistance.sort((a, b) => a.value.compareTo(b.value));

      // Return sorted branches
      return branchesWithDistance.map((e) => e.key).toList();
    } catch (e) {
      return _data.branches ?? [];
    }
  }
}
