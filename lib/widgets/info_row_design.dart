import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/extensions/color_extensions.dart';
import 'main_widget/app_text.dart';

class InfoRowDesign extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoRowDesign({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: context.colorScheme.primary, size: 20.sp),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.hint(text: title, textSize: 10),
              4.verticalSpace,
              AppText(
                text: value,
                textSize: 12,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
