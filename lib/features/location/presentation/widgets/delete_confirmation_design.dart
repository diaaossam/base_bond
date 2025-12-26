import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/response/my_address.dart';

class DeleteConfirmationSheet extends StatelessWidget {
  final MyAddress address;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const DeleteConfirmationSheet({super.key,
    required this.address,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(opacity: value, child: child),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 500),
              curve: Curves.elasticOut,
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red.shade100, Colors.red.shade50],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.red.shade600,
                  size: 40.sp,
                ),
              ),
            ),
            20.verticalSpace,
            AppText.title(
              text: context.localizations.deleteAddress,
              textSize: 16,
              fontWeight: FontWeight.w600,
            ),
            12.verticalSpace,
            AppText.body(
              text: context.localizations.deleteAddressConfirm,
              align: TextAlign.center,
              maxLines: 2,
            ),
            24.verticalSpace,
            // Address Preview
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: context.colorScheme.outline.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: AppImage.asset(
                      Assets.icons.pinLocation02,
                      color: context.colorScheme.primary,
                      height: 16.h,
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: address.address??'',
                          fontWeight: FontWeight.w500,
                          textSize: 13,
                          maxLines: 1,
                        ),
                          4.verticalSpace,
                          AppText.hint(
                            text: address.governorate?.title ?? '',
                            textSize: 11,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: _buildButton(
                    context: context,
                    label: context.localizations.cancel,
                    onTap: onCancel,
                    isPrimary: false,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: _buildButton(
                    context: context,
                    label: context.localizations.delete,
                    onTap: onConfirm,
                    isPrimary: true,
                    isDestructive: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required VoidCallback onTap,
    required bool isPrimary,
    bool isDestructive = false,
  }) {
    final color = isDestructive ? Colors.red : context.colorScheme.primary;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            gradient: isPrimary
                ? LinearGradient(colors: [color, color.withValues(alpha: 0.8)])
                : null,
            color: isPrimary ? null : color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: isPrimary
                ? null
                : Border.all(color: color.withValues(alpha: 0.3)),
            boxShadow: isPrimary
                ? [
                    BoxShadow(
                      color: color.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: AppText(
              text: label,
              color: isPrimary ? Colors.white : color,
              fontWeight: FontWeight.w600,
              textSize: 12,
            ),
          ),
        ),
      ),
    );
  }


}
