import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_success_dialog.dart';

class PrescriptionSuccessDialog extends StatefulWidget {

  const PrescriptionSuccessDialog({super.key,});

  static Future<void> show({required BuildContext context}) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.7),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return PrescriptionSuccessDialog();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  @override
  State<PrescriptionSuccessDialog> createState() =>
      _PrescriptionSuccessDialogState();
}

class _PrescriptionSuccessDialogState extends State<PrescriptionSuccessDialog>
    with TickerProviderStateMixin {
  late AnimationController _checkController;
  late AnimationController _confettiController;
  late AnimationController _contentController;
  late Animation<double> _checkScale;
  late Animation<double> _checkRotation;
  late Animation<double> _ringScale;
  late Animation<double> _contentSlide;
  late Animation<double> _contentFade;

  final List<ConfettiParticle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _generateConfetti();
    _startAnimations();
  }

  void _initAnimations() {
    // Check mark animation
    _checkController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _checkScale = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.3), weight: 40),
        TweenSequenceItem(tween: Tween(begin: 1.3, end: 0.9), weight: 20),
        TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 40),
      ],
    ).animate(CurvedAnimation(parent: _checkController, curve: Curves.easeOut));

    _checkRotation = Tween<double>(begin: -0.2, end: 0.0).animate(
      CurvedAnimation(
        parent: _checkController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _ringScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _checkController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // Confetti animation
    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    // Content animation
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _contentSlide = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeOutCubic),
    );

    _contentFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeOut),
    );
  }

  void _generateConfetti() {
    for (int i = 0; i < 50; i++) {
      _particles.add(
        ConfettiParticle(
          x: _random.nextDouble(),
          y: -0.1 - _random.nextDouble() * 0.3,
          size: 8 + _random.nextDouble() * 8,
          color: [
            const Color(0xFF7b4ce0),
            const Color(0xFFFF6B6B),
            const Color(0xFF4ECDC4),
            const Color(0xFFFFE66D),
            const Color(0xFF95E1D3),
            const Color(0xFFF38181),
          ][_random.nextInt(6)],
          speed: 0.3 + _random.nextDouble() * 0.4,
          rotation: _random.nextDouble() * 2 * pi,
          rotationSpeed: (_random.nextDouble() - 0.5) * 0.3,
          swayAmplitude: 0.02 + _random.nextDouble() * 0.03,
          swaySpeed: 2 + _random.nextDouble() * 3,
        ),
      );
    }
  }

  void _startAnimations() async {
    _checkController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _confettiController.repeat();
    await Future.delayed(const Duration(milliseconds: 400));
    _contentController.forward();
  }

  @override
  void dispose() {
    _checkController.dispose();
    _confettiController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // Confetti layer
          AnimatedBuilder(
            animation: _confettiController,
            builder: (context, child) {
              return CustomPaint(
                size: MediaQuery.of(context).size,
                painter: ConfettiPainter(
                  particles: _particles,
                  progress: _confettiController.value,
                ),
              );
            },
          ),
          // Main content
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(28.r),
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildSuccessHeader(context),
                    // Content
                    _buildContent(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 40.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withValues(alpha: 0.8),
            context.colorScheme.secondary,
          ],
        ),
      ),
      child: AnimatedBuilder(
        animation: _checkController,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // Outer ring
              Transform.scale(
                scale: _ringScale.value * 1.5,
                child: Container(
                  width: 120.w,
                  height: 120.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                ),
              ),
              // Middle ring
              Transform.scale(
                scale: _ringScale.value * 1.2,
                child: Container(
                  width: 100.w,
                  height: 100.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                ),
              ),
              // Check circle
              Transform.scale(
                scale: _checkScale.value,
                child: Transform.rotate(
                  angle: _checkRotation.value,
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.check_rounded,
                      color: context.colorScheme.primary,
                      size: 45.sp,
                    ),
                  ),
                ),
              ),
              // Sparkles
              ..._buildSparkles(),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildSparkles() {
    return List.generate(8, (index) {
      final angle = (index * pi / 4) + (_checkController.value * pi);
      final distance = 55.w + sin(_checkController.value * pi * 2) * 10;
      final opacity = sin(_checkController.value * pi).clamp(0.0, 1.0);

      return Transform.translate(
        offset: Offset(cos(angle) * distance, sin(angle) * distance),
        child: Opacity(
          opacity: opacity,
          child: Container(
            width: 6.w,
            height: 6.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.5),
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildContent(BuildContext context) {
    return AnimatedBuilder(
      animation: _contentController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _contentSlide.value),
          child: Opacity(
            opacity: _contentFade.value,
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  // Title
                  AppText.title(
                    text: context.localizations.orderPlacedSuccess,
                    textSize: 14,
                    fontWeight: FontWeight.w700,
                    align: TextAlign.center,
                  ),
                  12.verticalSpace,
                  // Subtitle
                  AppText.body(
                    text: context.localizations.orderPlacedSuccess2,
                    align: TextAlign.center,
                    color: context.colorScheme.shadow,
                    textSize: 10,
                  ),
                  32.verticalSpace,
                  // Buttons
                  CustomButton.outline(
                    text: context.localizations.home,
                    press: () {
                      Navigator.of(context).pop();
                      context.router.pushAndPopUntil(
                        MainLayoutRoute(),
                        predicate: (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
