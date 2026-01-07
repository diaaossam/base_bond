import 'package:animate_do/animate_do.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/branches/branches_cubit.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/branches/branches_data_state.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:bond/features/orders/presentation/widgets/cart/parmacy_pickup/branch_card_design.dart';
import 'package:bond/features/orders/presentation/widgets/cart/parmacy_pickup/empty_branches.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyPickupDesign extends StatefulWidget {
  final BranchesModel? selectedBranch;
  final Function(BranchesModel)? onBranchSelected;

  const PharmacyPickupDesign({
    super.key,
    this.selectedBranch,
    this.onBranchSelected,
  });

  @override
  State<PharmacyPickupDesign> createState() => _PharmacyPickupDesignState();
}

class _PharmacyPickupDesignState extends State<PharmacyPickupDesign> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<BranchesCubit>();
      cubit.findAndSetNearestBranch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchesCubit, BaseState<BranchesDataState>>(
      builder: (context, state) {
        final cubit = context.read<BranchesCubit>();
        final nearestBranch = state.data?.nearestBranch;
        final branches = state.data?.branches ?? [];
        final displayBranch = widget.selectedBranch ?? nearestBranch;
        if (branches.isEmpty) {
          return EmptyBranches();
        }
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.colorScheme.background,
                context.colorScheme.surface,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colorScheme.outline.withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.shadow.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.colorScheme.primary.withValues(alpha: 0.15),
                          context.colorScheme.primary.withValues(alpha: 0.08),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.store_rounded,
                      color: context.colorScheme.primary,
                      size: 18,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: AppText(
                      text: context.localizations.pharmacyPickup,
                      fontWeight: FontWeight.w600,
                      textSize: 11,
                    ),
                  ),
                  if (displayBranch != null)
                    InkWell(
                      onTap: () => _openLocationInMaps(
                        lat: displayBranch.latitude ?? 0,
                        lon: displayBranch.longitude ?? 0,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.near_me_rounded,
                              size: 14,
                              color: context.colorScheme.primary,
                            ),
                            4.horizontalSpace,
                            AppText(
                              text: context.localizations.trackOnMap,
                              textSize: 10,
                              fontWeight: FontWeight.w600,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 8.h),
              if (displayBranch != null)
                BranchCardDesign(
                  branch: displayBranch,
                  selectedBranch: widget.selectedBranch,
                  onBranchSelected: widget.onBranchSelected ?? (_) {},
                )
              else
                _buildSelectBranchButton(context, branches, cubit),
            ],
          ),
        );
      },
    );
  }

  void _showBranchSelectionDialog(
    BuildContext context,
    BranchesCubit cubit,
  ) async {
    OrderHelper().showBranchSelectionDialog(
      context: context,
      cubit: cubit,
      selectedBranch: widget.selectedBranch,
      onBranchSelected: widget.onBranchSelected,
    );
  }

  Widget _buildSelectBranchButton(
    BuildContext context,
    List<BranchesModel> branches,
    BranchesCubit cubit,
  ) {
    return InkWell(
      onTap: () => _showBranchSelectionDialog(context, cubit),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.1),
              context.colorScheme.primary.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.colorScheme.primary.withValues(alpha: 0.3),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store_rounded,
              size: 20,
              color: context.colorScheme.primary,
            ),
            12.horizontalSpace,
            AppText(
              text: context.localizations.choosePharmacyBranch,
              textSize: 13,
              fontWeight: FontWeight.w600,
              color: context.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openLocationInMaps({
    required double lat,
    required double lon,
  }) async {
    final Uri url = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$lat,$lon',
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not open Google Maps';
    }
  }
}
