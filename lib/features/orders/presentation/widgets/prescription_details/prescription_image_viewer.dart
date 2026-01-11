import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/color_extensions.dart';

class PrescriptionImageViewer extends StatelessWidget {
  final String? prescriptionImage;

  const PrescriptionImageViewer({super.key, this.prescriptionImage});

  @override
  Widget build(BuildContext context) {
    if (prescriptionImage == null || prescriptionImage!.isEmpty) {
      return _buildEmptyState(context);
    }

    return GestureDetector(
      onTap: () {
        // عرض الصورة بشكل كامل
        _showFullImage(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.08),
              blurRadius: 30,
              spreadRadius: 0,
              offset: const Offset(0, 10),
            ),
          ],
        ),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Stack(
            children: [
              AppImage.network(
                remoteImage: prescriptionImage!,
                width: double.infinity,
                height: 300.h,
                fit: BoxFit.contain,
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(
                    Icons.zoom_in_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: context.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 60.sp,
            color: context.colorScheme.outline,
          ),
          12.verticalSpace,
          Text(
            'لا توجد صورة للروشتة',
            style: TextStyle(
              fontSize: 14.sp,
              color: context.colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }

  void _showFullImage(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(16.w),
          child: Stack(
            children: [
              InteractiveViewer(
                maxScale: 5.0,
                minScale: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: AppImage.network(
                      remoteImage: prescriptionImage!,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
