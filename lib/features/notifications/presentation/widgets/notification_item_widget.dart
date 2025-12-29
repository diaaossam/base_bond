import 'dart:ui';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/notifications/data/models/notification_model.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemWidget extends StatefulWidget {
  final NotificationModel notification;
  final int index;
  final VoidCallback onDelete;

  const NotificationItemWidget({
    super.key,
    required this.notification,
    required this.index,
    required this.onDelete,
  });

  @override
  State<NotificationItemWidget> createState() => _NotificationItemWidgetState();
}

class _NotificationItemWidgetState extends State<NotificationItemWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _deleteController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _deleteAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    // Pulse animation for unread notifications
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _pulseAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    if (widget.notification.isRead != true) {
      _pulseController.repeat(reverse: true);
    }

    // Delete animation
    _deleteController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _deleteAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _deleteController, curve: Curves.easeInBack),
    );

    _deleteController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onDelete();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _deleteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isUnread = widget.notification.isRead != true;
    final colorScheme = context.colorScheme;

    return AnimatedBuilder(
      animation: _deleteAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _deleteAnimation.value,
          child: Opacity(
            opacity: _deleteAnimation.value.clamp(0.0, 1.0),
            child: child,
          ),
        );
      },
      child: Dismissible(
        key: Key(widget.notification.id ?? '${widget.index}'),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => widget.onDelete(),
        background: _buildDismissBackground(context),
        child: GestureDetector(
          onTap: () {
            // Handle notification tap
          },
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: isUnread
                          ? colorScheme.primary.withValues(
                              alpha: 0.15 + (_pulseAnimation.value * 0.1),
                            )
                          : colorScheme.shadow.withValues(alpha: 0.08),
                      blurRadius: isUnread ? 20 + (_pulseAnimation.value * 10) : 15,
                      spreadRadius: isUnread ? _pulseAnimation.value * 2 : 0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: child,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.surfaceContainer.withValues(alpha: 0.95),
                        colorScheme.surfaceContainer.withValues(alpha: 0.85),
                      ],
                    ),
                    border: Border.all(
                      color: isUnread
                          ? colorScheme.primary.withValues(alpha: 0.3)
                          : colorScheme.outline.withValues(alpha: 0.2),
                      width: isUnread ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIconContainer(context, isUnread),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AppText(
                                    text: widget.notification.title ?? '',
                                    fontWeight: isUnread
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    textSize: 12,
                                    maxLines: 2,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                if (isUnread) _buildUnreadIndicator(context),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            AppText(
                              text: widget.notification.description ?? '',
                              textSize: 10,
                              maxLines: 3,
                              color: colorScheme.shadow,
                              textHeight: 1.5,
                            ),
                            SizedBox(height: 10.h),
                            _buildTimeRow(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconContainer(BuildContext context, bool isUnread) {
    final colorScheme = context.colorScheme;

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Container(
          width: 52.w,
          height: 52.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isUnread
                  ? [
                      colorScheme.primary.withValues(
                        alpha: 0.9 + (_pulseAnimation.value * 0.1),
                      ),
                      colorScheme.secondary.withValues(
                        alpha: 0.8 + (_pulseAnimation.value * 0.2),
                      ),
                    ]
                  : [
                      colorScheme.primary.withValues(alpha: 0.15),
                      colorScheme.secondary.withValues(alpha: 0.1),
                    ],
            ),
            boxShadow: isUnread
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(
                        alpha: 0.3 + (_pulseAnimation.value * 0.2),
                      ),
                      blurRadius: 12 + (_pulseAnimation.value * 8),
                      spreadRadius: _pulseAnimation.value * 2,
                    ),
                  ]
                : null,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Animated ring effect for unread
              if (isUnread)
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.8 + (_pulseAnimation.value * 0.4),
                      child: Container(
                        width: 52.w,
                        height: 52.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: colorScheme.primary.withValues(
                              alpha: 0.5 * (1 - _pulseAnimation.value),
                            ),
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              AppImage.asset(
                Assets.icons.notification,
                size: 24.w,
                color: isUnread ? Colors.white : colorScheme.primary,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUnreadIndicator(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Container(
          width: 10.w,
          height: 10.w,
          margin: EdgeInsets.only(left: 8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(
                  alpha: 0.4 + (_pulseAnimation.value * 0.3),
                ),
                blurRadius: 6 + (_pulseAnimation.value * 4),
                spreadRadius: _pulseAnimation.value * 2,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTimeRow(BuildContext context) {
    final colorScheme = context.colorScheme;
    final timeText = _getTimeText();

    return Row(
      children: [
        Icon(
          Icons.access_time_rounded,
          size: 14.w,
          color: colorScheme.shadow.withValues(alpha: 0.7),
        ),
        SizedBox(width: 4.w),
        AppText.hint(
          text: timeText,
          textSize: 11,
          color: colorScheme.shadow.withValues(alpha: 0.7),
        ),
      ],
    );
  }

  String _getTimeText() {
    final createdAt = widget.notification.createdAt;
    if (createdAt == null) return '';

    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }

  Widget _buildDismissBackground(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.transparent,
            const Color(0xFFFF6B6B).withValues(alpha: 0.2),
            const Color(0xFFFF6B6B).withValues(alpha: 0.9),
          ],
          stops: const [0.0, 0.3, 1.0],
        ),
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 300),
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.8 + (0.2 * value),
                child: Transform.rotate(
                  angle: (1 - value) * 0.3,
                  child: Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.white,
                      size: 26.w,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

