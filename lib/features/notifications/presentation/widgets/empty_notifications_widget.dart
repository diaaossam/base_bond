import 'dart:math' as math;
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotificationsWidget extends StatefulWidget {
  const EmptyNotificationsWidget({super.key});

  @override
  State<EmptyNotificationsWidget> createState() =>
      _EmptyNotificationsWidgetState();
}

class _EmptyNotificationsWidgetState extends State<EmptyNotificationsWidget>
    with TickerProviderStateMixin {
  late AnimationController _bellController;
  late AnimationController _floatController;
  late AnimationController _glowController;
  late AnimationController _particleController;

  late Animation<double> _bellAnimation;
  late Animation<double> _floatAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    // Bell swing animation
    _bellController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _bellAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 0.15)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.15, end: -0.12)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -0.12, end: 0.08)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 0.08, end: 0.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 25,
      ),
    ]).animate(_bellController);

    // Start bell animation periodically
    _startBellAnimation();

    // Floating animation
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // Glow animation
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Particle animation
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  void _startBellAnimation() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        _bellController.forward(from: 0);
      }
    }
  }

  @override
  void dispose() {
    _bellController.dispose();
    _floatController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              _buildAnimatedIcon(context),
              SizedBox(height: 40.h),
              _buildTextContent(context),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedIcon(BuildContext context) {
    final colorScheme = context.colorScheme;

    return SizedBox(
      width: 200.w,
      height: 200.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated particles
          ...List.generate(6, (index) => _buildParticle(context, index)),

          // Glow effect
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: 140.w,
                height: 140.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary
                          .withValues(alpha: _glowAnimation.value * 0.3),
                      blurRadius: 40 + (_glowAnimation.value * 20),
                      spreadRadius: _glowAnimation.value * 10,
                    ),
                  ],
                ),
              );
            },
          ),

          // Outer ring
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: 160.w,
                height: 160.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.primary.withValues(
                      alpha: 0.1 + (_glowAnimation.value * 0.15),
                    ),
                    width: 2,
                  ),
                ),
              );
            },
          ),

          // Inner ring
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: 130.w,
                height: 130.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.secondary.withValues(
                      alpha: 0.15 + (_glowAnimation.value * 0.1),
                    ),
                    width: 1.5,
                  ),
                ),
              );
            },
          ),

          // Bell icon with animations
          AnimatedBuilder(
            animation: Listenable.merge([_floatAnimation, _bellAnimation]),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _floatAnimation.value),
                child: Transform.rotate(
                  angle: _bellAnimation.value,
                  alignment: const Alignment(0, -0.5),
                  child: child,
                ),
              );
            },
            child: Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary,
                    colorScheme.secondary,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AppImage.asset(
                    Assets.icons.notification,
                    size: 44.w,
                    color: Colors.white,
                  ),
                  // Small "z" letters floating
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildParticle(BuildContext context, int index) {
    final colorScheme = context.colorScheme;
    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      const Color(0xFF22c1e0),
      const Color(0xFFf15f6d),
    ];

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final angle = (index * math.pi / 3) + (_particleController.value * 2 * math.pi);
        final radius = 80.w + (math.sin(_particleController.value * math.pi * 2 + index) * 10);
        final x = math.cos(angle) * radius;
        final y = math.sin(angle) * radius;
        final particleOpacity =
            0.3 + (math.sin(_particleController.value * math.pi * 2 + index * 2) * 0.4);

        return Transform.translate(
          offset: Offset(x, y),
          child: Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index % colors.length].withValues(alpha: particleOpacity),
              boxShadow: [
                BoxShadow(
                  color: colors[index % colors.length].withValues(alpha: particleOpacity * 0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final colorScheme = context.colorScheme;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: 0.6,
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  colorScheme.primary,
                  colorScheme.secondary,
                ],
              ).createShader(bounds);
            },
            child: AppText.title(
              text: context.localizations.noNotificationTitle,
              textSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              align: TextAlign.center,
            ),
          ),
          SizedBox(height: 12.h),
          AppText.hint(
            text: context.localizations.noNotificationBody,
            textSize: 11,
            color: colorScheme.shadow,
            align: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

