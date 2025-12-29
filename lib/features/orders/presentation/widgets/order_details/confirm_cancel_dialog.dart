import 'dart:math' as math;

import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmCancelOrderDialog extends StatefulWidget {
  final VoidCallback onConfirm;

  const ConfirmCancelOrderDialog({super.key, required this.onConfirm});

  static Future<bool?> show(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Confirm Cancel Order Dialog',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        return ConfirmCancelOrderDialog(onConfirm: onConfirm);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );
        return ScaleTransition(
          scale: curvedAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  @override
  State<ConfirmCancelOrderDialog> createState() =>
      _ConfirmCancelOrderDialogState();
}

class _ConfirmCancelOrderDialogState extends State<ConfirmCancelOrderDialog>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    _rippleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _iconController.dispose();
    _rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: context.colorScheme.surfaceContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnimatedIcon(),
                  20.verticalSpace,
                  AppText.title(
                    text: context.localizations.cancelOrder,
                    fontWeight: FontWeight.w700,
                    textSize: 15,
                  ),
                  12.verticalSpace,
                  AppText(
                    text: context.localizations.cancelOrderConfirm,
                    textSize: 13,
                    align: TextAlign.center,
                    color: context.colorScheme.shadow,
                  ),
                  28.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton.outline(
                          borderColor: context.colorScheme.error,
                          textColor: context.colorScheme.error,
                          text: context.localizations.cancel,
                          press: () => Navigator.pop(context),
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: SizedBox(
                          height: 50.h,
                          child: CustomButton(
                            backgroundColor: context.colorScheme.error,
                            text: context.localizations.confirm,
                            press: () {
                              widget.onConfirm();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon() {
    return SizedBox(
      width: 90.w,
      height: 90.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ripple effect
          AnimatedBuilder(
            animation: _rippleController,
            builder: (context, child) {
              return CustomPaint(
                size: Size(90.w, 90.w),
                painter: _RipplePainter(
                  animation: _rippleController.value,
                  color: const Color(0xFFef4444),
                ),
              );
            },
          ),
          // Main icon container
          SizedBox(
            width: 70.w,
            height: 70.w,
            child: AnimatedBuilder(
              animation: _iconController,
              builder: (context, child) {
                // Subtle floating animation
                final floatOffset = math.sin(_iconController.value * 2 * math.pi) * 2;
                return Transform.translate(
                  offset: Offset(0, floatOffset),
                  child: AppImage.asset(Assets.images.order.path),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RipplePainter extends CustomPainter {
  final double animation;
  final Color color;

  _RipplePainter({required this.animation, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Draw multiple ripple rings
    for (int i = 0; i < 3; i++) {
      final progress = (animation + i * 0.33) % 1.0;
      final radius = 25 + (progress * 20);
      final opacity = (1 - progress) * 0.3;

      final paint = Paint()
        ..color = color.withValues(alpha: opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _RipplePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
