import 'package:bond/core/extensions/color_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsShimmer extends StatefulWidget {
  const NotificationsShimmer({super.key});

  @override
  State<NotificationsShimmer> createState() => _NotificationsShimmerState();
}

class _NotificationsShimmerState extends State<NotificationsShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _shimmerAnimation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 300 + (index * 100)),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            return Transform.translate(
              offset: Offset(0, 30 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: child,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _ShimmerNotificationCard(
              shimmerAnimation: _shimmerAnimation,
              index: index,
            ),
          ),
        );
      },
    );
  }
}

class _ShimmerNotificationCard extends StatelessWidget {
  final Animation<double> shimmerAnimation;
  final int index;

  const _ShimmerNotificationCard({
    required this.shimmerAnimation,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final baseColor = isDark
        ? colorScheme.surfaceContainer.withValues(alpha: 0.6)
        : Colors.grey.shade200;
    final highlightColor = isDark
        ? colorScheme.surfaceContainer.withValues(alpha: 0.9)
        : Colors.grey.shade50;

    return AnimatedBuilder(
      animation: shimmerAnimation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: colorScheme.surfaceContainer,
            border: Border.all(
              color: colorScheme.outline.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon placeholder
              _buildShimmerBox(
                width: 52.w,
                height: 52.w,
                borderRadius: 16.r,
                baseColor: baseColor,
                highlightColor: highlightColor,
                offset: shimmerAnimation.value,
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title placeholder
                    _buildShimmerBox(
                      width: double.infinity,
                      height: 16.h,
                      borderRadius: 8.r,
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      offset: shimmerAnimation.value,
                    ),
                    SizedBox(height: 8.h),
                    // Description placeholder line 1
                    _buildShimmerBox(
                      width: double.infinity,
                      height: 12.h,
                      borderRadius: 6.r,
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      offset: shimmerAnimation.value + 0.2,
                    ),
                    SizedBox(height: 6.h),
                    // Description placeholder line 2
                    _buildShimmerBox(
                      width: 180.w,
                      height: 12.h,
                      borderRadius: 6.r,
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      offset: shimmerAnimation.value + 0.4,
                    ),
                    SizedBox(height: 12.h),
                    // Time placeholder
                    _buildShimmerBox(
                      width: 80.w,
                      height: 10.h,
                      borderRadius: 5.r,
                      baseColor: baseColor,
                      highlightColor: highlightColor,
                      offset: shimmerAnimation.value + 0.6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShimmerBox({
    required double width,
    required double height,
    required double borderRadius,
    required Color baseColor,
    required Color highlightColor,
    required double offset,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment(-1 + offset, 0),
          end: Alignment(1 + offset, 0),
          colors: [
            baseColor,
            highlightColor,
            baseColor,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

