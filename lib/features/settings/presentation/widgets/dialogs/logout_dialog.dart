import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/presentation/cubit/logout/logout_cubit.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/dependencies/injectable_dependencies.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showGeneralDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Logout Dialog',
      barrierColor: Colors.black.withValues(alpha: 0.6),
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) {
        return LogoutDialog();
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
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog>
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
    return BlocProvider(
      create: (context) => sl<LogoutCubit>(),
      child: Center(
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
                      text: context.localizations.logOut,
                      fontWeight: FontWeight.w700,
                      textSize: 13,
                    ),
                    12.verticalSpace,
                    AppText(
                      text: context.localizations.logoutBody,
                      textSize: 11,
                      align: TextAlign.center,
                      color: context.colorScheme.shadow,
                    ),
                    28.verticalSpace,
                    BlocConsumer<LogoutCubit, BaseState<void>>(
                      listener: (context, state) {
                        if (state.isSuccess) {
                          context.router.pushAndPopUntil(
                            LoginRoute(),
                            predicate: (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return Row(
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
                                  isLoading: state.isLoading,
                                  text: context.localizations.logOut,
                                  press: () =>
                                      context.read<LogoutCubit>().logout(),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
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
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFfee2e2), Color(0xFFfecaca)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFef4444).withValues(alpha: 0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: AnimatedBuilder(
              animation: _iconController,
              builder: (context, child) {
                // Subtle floating animation
                final floatOffset =
                    math.sin(_iconController.value * 2 * math.pi) * 2;
                return Transform.translate(
                  offset: Offset(0, floatOffset),
                  child: Icon(
                    Icons.logout_rounded,
                    size: 32.sp,
                    color: const Color(0xFFef4444),
                  ),
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
