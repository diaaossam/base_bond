import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/orders/order_helper.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusTimeline extends StatefulWidget {
  final OrderType currentStatus;

  const OrderStatusTimeline({super.key, required this.currentStatus});

  @override
  State<OrderStatusTimeline> createState() => _OrderStatusTimelineState();
}

class _OrderStatusTimelineState extends State<OrderStatusTimeline>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;

  final List<OrderType> _statusOrder = [
    OrderType.pending,
    OrderType.confirmed,
    OrderType.inProgress,
    OrderType.outForDeleivery,
    OrderType.delivered,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    final currentIndex = _statusOrder.indexOf(widget.currentStatus);
    final progress = currentIndex >= 0
        ? currentIndex / (_statusOrder.length - 1)
        : 0.0;

    _progressAnimation = Tween<double>(
      begin: 0,
      end: progress,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentStatus == OrderType.canceled ||
        widget.currentStatus == OrderType.returns) {
      return _buildSpecialStatus(context);
    }

    return  AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Column(
          children: List.generate(_statusOrder.length, (index) {
            return _buildTimelineItem(
              context,
              status: _statusOrder[index],
              index: index,
              isLast: index == _statusOrder.length - 1,
            );
          }),
        );
      },
    );
  }

  Widget _buildSpecialStatus(BuildContext context) {
    final isCanceled = widget.currentStatus == OrderType.canceled;
    final color = isCanceled ? Colors.red : Colors.amber;
    final label = isCanceled
        ? context.localizations.canceled
        : context.localizations.returns;
    final icon = isCanceled
        ? Icons.cancel_outlined
        : Icons.assignment_return_outlined;

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: label,
                  textSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                ),
                4.verticalSpace,
                AppText.hint(
                  text: isCanceled ? 'تم إلغاء الطلب' : 'تم استرجاع الطلب',
                  textSize: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required OrderType status,
    required int index,
    required bool isLast,
  }) {
    final currentIndex = _statusOrder.indexOf(widget.currentStatus);
    final isPast = index <= currentIndex;
    final isCurrent = index == currentIndex;
    final animatedProgress =
        _progressAnimation.value * (_statusOrder.length - 1);
    final isAnimatedPast = index <= animatedProgress;

    final statusInfo = OrderHelper().getStatusInfo(context, status);
    final color = isAnimatedPast
        ? statusInfo.color
        : context.colorScheme.outline;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 40.w,
            child: Column(
              children: [
                // Circle indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isCurrent ? 28.w : 22.w,
                  height: isCurrent ? 28.w : 22.w,
                  decoration: BoxDecoration(
                    color: isAnimatedPast
                        ? color.withValues(alpha: 0.2)
                        : context.colorScheme.surface,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isAnimatedPast
                          ? color
                          : context.colorScheme.outline,
                      width: isCurrent ? 3 : 2,
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: color.withValues(alpha: 0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: isAnimatedPast
                      ? Center(
                          child: Icon(
                            isPast && !isCurrent
                                ? Icons.check
                                : statusInfo.icon,
                            color: color,
                            size: isCurrent ? 14.sp : 12.sp,
                          ),
                        )
                      : null,
                ),
                // Connecting line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 3.w,
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            isAnimatedPast
                                ? color
                                : context.colorScheme.outline.withValues(
                                    alpha: 0.3,
                                  ),
                            (index + 1 <= animatedProgress)
                                ? OrderHelper()
                                      .getStatusInfo(
                                        context,
                                        _statusOrder[index + 1],
                                      )
                                      .color
                                : context.colorScheme.outline.withValues(
                                    alpha: 0.3,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppText(
                          text: statusInfo.label ?? "",
                          textSize: 12,
                          fontWeight: isCurrent
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isAnimatedPast
                              ? context.colorScheme.onSurface
                              : context.colorScheme.shadow,
                        ),
                      ),
                      if (isCurrent)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 6.w,
                                height: 6.w,
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              6.horizontalSpace,
                              AppText(
                                text: 'الحالية',
                                textSize: 10,
                                fontWeight: FontWeight.w600,
                                color: color,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  4.verticalSpace,
                  AppText.hint(text: statusInfo.description, textSize: 9),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
