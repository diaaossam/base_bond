import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/extensions/color_extensions.dart';
import '../../core/utils/app_size.dart';

class DropdownShimmer extends StatelessWidget {
  final int count;

  const DropdownShimmer({
    super.key,
    this.count = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        count,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: index == count - 1 ? 0 : SizeConfig.bodyHeight * .02,
          ),
          child: _ShimmerDropdownItem(),
        ),
      ),
    );
  }
}

class _ShimmerDropdownItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.shadow.withOpacity(0.2),
      highlightColor: context.colorScheme.shadow.withOpacity(0.1),
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.colorScheme.outline.withOpacity(0.2),
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          children: [
            // Shimmer box for text
            Expanded(
              child: Container(
                height: 16.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Shimmer box for icon
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

