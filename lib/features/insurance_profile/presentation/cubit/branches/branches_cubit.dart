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
    : super(BaseState.initial(data: const BranchesDataState()));

  BranchesDataState get _data => state.data ?? const BranchesDataState();

  Future<void> loadAllBranches() async {
    if (isClosed) return;
    await handleAsync(
      identifier: 'branches',
      call: () => appRepositoryImpl.getBranches(),
      onSuccess: (branches) => _data.copyWith(branches: branches),
    );
  }

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
      if (nearestBranch != null) {
        emit(
          state.copyWith(data: _data.copyWith(nearestBranch: nearestBranch)),
        );
      }

      return nearestBranch;
    } catch (e) {
      return null;
    }
  }

  Future<void> findAndSetNearestBranch() async {
    if (isClosed) return;
    if (_data.branches == null || _data.branches!.isEmpty) {
      await loadAllBranches();
    }
    final nearestBranch = await getNearestBranch();
    if (nearestBranch != null) {
      emit(state.copyWith(data: _data.copyWith(nearestBranch: nearestBranch)));
    }
  }

  Future<List<BranchesModel>> getBranchesSortedByDistance() async {
    if (isClosed) return [];
    try {
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
          .where(
            (branch) => branch.latitude != null && branch.longitude != null,
          )
          .map((branch) {
            final distance = locationService.calculateDistance(
              currentLocation.latitude,
              currentLocation.longitude,
              branch.latitude!,
              branch.longitude!,
            );
            return MapEntry(branch, distance);
          })
          .toList();

      // Sort by distance
      branchesWithDistance.sort((a, b) => a.value.compareTo(b.value));

      // Return sorted branches
      return branchesWithDistance.map((e) => e.key).toList();
    } catch (e) {
      return _data.branches ?? [];
    }
  }
}
