import 'package:auto_route/auto_route.dart';
import 'package:bond/features/location/data/models/requests/location_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/router/app_router.gr.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'animted_fold_section.dart';

class PickLocationDesign extends StatelessWidget {
  final Function(LocationEntity) onLocationPicked;
  final LocationEntity? locationEntity;

  const PickLocationDesign({
    super.key,
    this.locationEntity,
    required this.onLocationPicked,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFormSection(
      delay: 0,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.08),
              context.colorScheme.primary.withValues(alpha: 0.03),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: context.colorScheme.primary.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        context.colorScheme.primary,
                        context.colorScheme.primary.withValues(alpha: 0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.3,
                        ),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: AppImage.asset(
                    Assets.icons.mapsLocation01,
                    color: Colors.white,
                    height: 24.h,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.title(
                        text: context.localizations.locationOnMap,
                        textSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      6.verticalSpace,
                      AppText.hint(
                        text: locationEntity != null
                            ? context.localizations.locationPickedSuccessFully
                            : context.localizations.addAddressDeleivery,
                        textSize: 10,
                        color: locationEntity != null
                            ? Colors.green.shade600
                            : context.colorScheme.shadow,
                      ),
                    ],
                  ),
                ),
                if (locationEntity != null)
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(scale: value, child: child);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_rounded,
                        color: Colors.green.shade600,
                        size: 18.sp,
                      ),
                    ),
                  ),
              ],
            ),
            16.verticalSpace,
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.router
                      .push<LocationEntity>(const PickLocationRoute())
                      .then((p0) {
                        if (p0 != null) {
                          onLocationPicked(p0);
                        }
                      });
                },
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: context.colorScheme.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        locationEntity != null
                            ? Icons.edit_location_outlined
                            : Icons.add_location_alt_outlined,
                        color: context.colorScheme.primary,
                        size: 20.sp,
                      ),
                      10.horizontalSpace,
                      AppText(
                        text: locationEntity != null
                            ? context.localizations.edit
                            : context.localizations.locationOnMap,
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                        textSize: 11,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
