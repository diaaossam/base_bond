import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubstanceLoadingShimmer extends StatelessWidget {
  const SubstanceLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title shimmer
            Container(
              width: 150.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 16.h),
            // Chips shimmer
            Wrap(
              spacing: 8.w,
              runSpacing: 10.h,
              children: List.generate(6, (index) {
                return Container(
                  width: 100.w + (index * 10),
                  height: 36.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
