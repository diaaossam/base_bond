import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';

class InsuranceHeaderInfo extends StatelessWidget {
  final InsuranceProfileModel model;
  final VoidCallback onEdit;
  const InsuranceHeaderInfo({super.key, required this.model, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.health_and_safety,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
          16.verticalSpace,
          AppText(
            text: context.localizations.insuranceProfile,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            textSize: 13,
          ),
          8.verticalSpace,
          AppText(
            text: model.insuranceCompany?.title ?? "",
            color: Colors.white.withValues(alpha: 0.9),
            textSize: 10,
          ),
          16.verticalSpace,
          InkWell(
            onTap: onEdit,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit_outlined,
                    color: context.colorScheme.primary,
                    size: 18.sp,
                  ),
                  8.horizontalSpace,
                  AppText(
                    text: context.localizations.editFile,
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    textSize: 11,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
