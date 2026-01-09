import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';

class EmptyInsuranceProfile extends StatelessWidget {
  final VoidCallback onCreatePressed;
  final bool showDescription;

  const EmptyInsuranceProfile({super.key, required this.onCreatePressed,  this.showDescription = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.8, end: 1.0),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Container(
                padding: EdgeInsets.all(32.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.colorScheme.primary.withValues(alpha: 0.1),
                      context.colorScheme.primary.withValues(alpha: 0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  padding: EdgeInsets.all(24.w),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.health_and_safety_outlined,
                    size: 64.sp,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
            ),
            32.verticalSpace,

            // Title
            AppText(
              text: context.localizations.no_insurance_profile_title,
              fontWeight: FontWeight.bold,
              textSize: 16,
              align: TextAlign.center,
            ),
            16.verticalSpace,

              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: AppText(
                  text: context.localizations.no_insurance_profile_description,
                  textSize: 12,
                  align: TextAlign.center,
                  maxLines: 4,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              40.verticalSpace,


            // Create Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: CustomButton(
                text: context.localizations.create_insurance_profile_button,
                press: onCreatePressed,
              ),
            ),
            if(showDescription)
            _buildFeaturesList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesList(BuildContext context) {
    final features = [
      context.localizations.insurance_feature_discount,
      context.localizations.insurance_feature_tracking,
      context.localizations.insurance_feature_coverage,
    ];

    return Column(
      children: features.map((feature) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: context.colorScheme.primary,
                  size: 14.sp,
                ),
              ),
              8.horizontalSpace,
              AppText(
                text: feature,
                textSize: 13,
                color: context.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
