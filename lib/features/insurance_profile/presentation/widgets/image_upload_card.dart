import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/image_picker/app_image.dart';
import '../../../../widgets/image_picker/pick_image_sheet.dart';
import '../../../../widgets/main_widget/app_text.dart';

class ImageUploadCard extends StatelessWidget {
  final String title;
  final String hint;
  final File? selectedFile;
  final String? existingImageUrl;
  final Function(File) onImageSelected;
  final IconData icon;

  const ImageUploadCard({
    super.key,
    required this.title,
    required this.hint,
    this.selectedFile,
    this.existingImageUrl,
    required this.onImageSelected,
    this.icon = Icons.add_photo_alternate_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showImagePicker(context),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: _hasImage
                ? context.colorScheme.primary
                : context.colorScheme.outline.withValues(alpha: 0.3),
            width: _hasImage ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: _hasImage
                        ? context.colorScheme.primary.withValues(alpha: 0.1)
                        : context.colorScheme.outline.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    _hasImage ? Icons.check_circle : icon,
                    color: _hasImage
                        ? context.colorScheme.primary
                        : context.colorScheme.onSurface.withValues(alpha: 0.5),
                    size: 24.sp,
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: title,
                        fontWeight: FontWeight.w600,
                        textSize: 14,
                      ),
                      4.verticalSpace,
                      AppText(
                        text: _hasImage ? 'تم الاختيار ✓' : hint,
                        textSize: 12,
                        color: _hasImage
                            ? context.colorScheme.primary
                            : context.colorScheme.onSurface
                                .withValues(alpha: 0.5),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.camera_alt_outlined,
                  color: context.colorScheme.primary,
                  size: 24.sp,
                ),
              ],
            ),
            if (_hasImage) ...[
              16.verticalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: _buildImagePreview(context),
              ),
            ],
          ],
        ),
      ),
    );
  }

  bool get _hasImage => selectedFile != null || existingImageUrl != null;

  Widget _buildImagePreview(BuildContext context) {
    if (selectedFile != null) {
      return Image.file(
        selectedFile!,
        height: 120.h,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    } else if (existingImageUrl != null) {
      if (existingImageUrl!.startsWith('/')) {
        // It's a local file path
        return Image.file(
          File(existingImageUrl!),
          height: 120.h,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }
      return AppImage.network(
        remoteImage: existingImageUrl,
        height: 120.h,
        width: double.infinity,
        fit: BoxFit.cover,
      );
    }
    return const SizedBox.shrink();
  }

  void _showImagePicker(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => PickMediaFileSheet(
        onPickFile: (file, thumbnail) {
          onImageSelected(file);
        },
      ),
    );
  }
}


