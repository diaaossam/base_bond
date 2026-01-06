import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';

class SectionTitleDesign extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionTitleDesign({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        10.horizontalSpace,
        Icon(icon, color: context.colorScheme.primary, size: 20.sp),
        8.horizontalSpace,
        AppText.title(text: title, textSize: 13, fontWeight: FontWeight.w600),
      ],
    );
  }
}
