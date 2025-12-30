import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterSectionTitle extends StatelessWidget {
  final String title;

  const FilterSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: AppText(
        text: title,
        textSize: 12,
        fontWeight: FontWeight.bold,
        color: context.colorScheme.onSurface,
      ),
    );
  }
}




