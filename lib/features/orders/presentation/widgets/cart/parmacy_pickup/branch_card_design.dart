import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/insurance_profile/presentation/cubit/branches/branches_cubit.dart';
import 'package:bond/features/location/location_helper.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../widgets/image_picker/app_image.dart';
import '../../../../../../widgets/main_widget/app_text.dart';
import '../../../../../app/data/models/branches_model.dart';

class BranchCardDesign extends StatelessWidget {
  final BranchesModel branch;
  final Function(BranchesModel) onBranchSelected;

  const BranchCardDesign({
    super.key,
    required this.branch,
    required this.onBranchSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.05),
              context.colorScheme.primary.withValues(alpha: 0.02),
            ],
          ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
            width: 1.5,
          ),
        ),
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: AppImage.asset(
                    Assets.icons.insuranceCompany,
                    color: context.colorScheme.primary,
                    height: 20,
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: branch.title ?? '',
                        fontWeight: FontWeight.w600,
                        textSize: 10,
                        maxLines: 2,
                      ),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
                FutureBuilder<double?>(
                  future: LocationHelper().calculateDistance(branch: branch),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final distance = snapshot.data!;
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context.colorScheme.primary,
                              context.colorScheme.primary.withValues(
                                alpha: 0.8,
                              ),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.social_distance_outlined,
                              size: 14,
                              color: Colors.white,
                            ),
                            4.horizontalSpace,
                            AppText(
                              text: '${distance.toStringAsFixed(1)} ${context.localizations.km}',
                              textSize: 9,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ],
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: () => OrderHelper().showBranchSelectionDialog(
                context: context,
                cubit: context.read<BranchesCubit>(),
                onBranchSelected: onBranchSelected,
                selectedBranch: branch,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.primary.withValues(alpha: 0.15),
                      context.colorScheme.primary.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: context.colorScheme.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.swap_horiz_rounded,
                      size: 16,
                      color: context.colorScheme.primary,
                    ),
                    8.horizontalSpace,
                    AppText(
                      text: context.localizations.chooseAnotherBranch,
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
      ),
    );
  }
}
