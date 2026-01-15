import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/location/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../widgets/main_widget/app_text.dart';
import '../../../../../app/data/models/branches_model.dart';

class BranchSelectionSheet extends StatefulWidget {
  final List<BranchesModel> branches;
  final BranchesModel? selectedBranch;
  final bool isSheet;
  final Function(BranchesModel) onBranchSelected;

  const BranchSelectionSheet({
    super.key,
    required this.branches,
    this.selectedBranch,
    required this.onBranchSelected,
    this.isSheet = true,
  });

  @override
  State<BranchSelectionSheet> createState() => BranchSelectionSheetState();
}

class BranchSelectionSheetState extends State<BranchSelectionSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: context.colorScheme.outline.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          if(widget.isSheet)...[
            SizedBox(height: 20.h),
            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  AppText(
                    text: context.localizations.choosePharmacyBranch,
                    fontWeight: FontWeight.w700,
                    textSize: 13,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(context),
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
          ],

          // Branches list
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: widget.branches.length,
              itemBuilder: (context, index) {
                final branch = widget.branches[index];
                final isSelected = widget.selectedBranch?.id == branch.id;
                return _BranchListItem(
                  branch: branch,
                  isSelected: isSelected,
                  onTap: () => widget.onBranchSelected(branch),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BranchListItem extends StatelessWidget {
  final BranchesModel branch;
  final bool isSelected;
  final VoidCallback onTap;

  const _BranchListItem({
    required this.branch,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.1),
                    context.colorScheme.primary.withValues(alpha: 0.05),
                  ],
                )
              : null,
          color: isSelected ? null : context.colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            width: isSelected ? 2 : 1.5,
            color: isSelected
                ? context.colorScheme.primary
                : context.colorScheme.outline.withValues(alpha: 0.3),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: isSelected
                    ? context.colorScheme.primary.withValues(alpha: 0.15)
                    : context.colorScheme.shadow.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.store_rounded,
                size: 20,
                color: isSelected
                    ? context.colorScheme.primary
                    : context.colorScheme.shadow,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: branch.title ?? '',
                    fontWeight: FontWeight.w600,
                    textSize: 11,
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  AppText(
                    text: branch.address ?? '',
                    color: context.colorScheme.shadow,
                    fontWeight: FontWeight.w600,
                    textSize: 9,
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  FutureBuilder<double?>(
                    future: LocationHelper().calculateDistance(branch: branch),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        return Row(
                          children: [
                            Icon(
                              Icons.straighten_rounded,
                              size: 12,
                              color: context.colorScheme.shadow,
                            ),
                            4.horizontalSpace,
                            AppText(
                              text:
                                  '${snapshot.data!.toStringAsFixed(1)} ${context.localizations.km}',
                              textSize: 11,
                              color: context.colorScheme.shadow,
                            ),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check_rounded, size: 16, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
