import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartNoteDesign extends StatelessWidget {
  final TextEditingController note;

  const CartNoteDesign({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.shadow.withOpacity(0.15),
                        colorScheme.shadow.withOpacity(0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.edit_note_rounded,
                    color: colorScheme.shadow,
                    size: 22,
                  ),
                ),
                12.horizontalSpace,
                AppText(
                  text: context.localizations.addNote,
                  fontWeight: FontWeight.w700,
                  textSize: 12,
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Note input field with subtle styling
            CustomTextFormField(
              controller: note,
              prefixIcon: AppImage.asset(Assets.icons.edit2),
              hintText: context.localizations.addNoteHint,
              filled: true,
              maxLines: 2,
              fillColor: colorScheme.background,
            ),
          ],
        ),
      ),
    );
  }
}
