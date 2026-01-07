import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../widgets/main_widget/app_text.dart';

class EmptyBranches extends StatelessWidget {
  const EmptyBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.store_outlined,
              size: 48,
              color: context.colorScheme.shadow.withValues(alpha: 0.5),
            ),
            SizedBox(height: 12.h),
            AppText(
              text: context.localizations.emptyBranches,
              textSize: 12,
              color: context.colorScheme.shadow,
            ),
          ],
        ),
      ),
    );
  }
}
