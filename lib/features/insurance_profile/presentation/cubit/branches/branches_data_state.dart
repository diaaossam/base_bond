import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:equatable/equatable.dart';

class BranchesDataState extends Equatable {
  final List<BranchesModel>? branches;
  final BranchesModel? nearestBranch;

  const BranchesDataState({
    this.branches,
    this.nearestBranch,
  });

  BranchesDataState copyWith({
    List<BranchesModel>? branches,
    BranchesModel? nearestBranch,
    bool clearNearestBranch = false,
  }) {
    return BranchesDataState(
      branches: branches ?? this.branches,
      nearestBranch: clearNearestBranch
          ? null
          : (nearestBranch ?? this.nearestBranch),
    );
  }

  @override
  List<Object?> get props => [branches, nearestBranch];
}
