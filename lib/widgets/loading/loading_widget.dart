import 'dart:math' as math;

import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../gen/assets.gen.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    super.key,
    this.size = LoadingSize.small,
    this.showText = true,
    this.backgroundColor,
  });

  /// Size of the loading widget
  final LoadingSize size;

  /// Whether to show loading text
  final bool showText;

  /// Optional background color (transparent by default)
  final Color? backgroundColor;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

enum LoadingSize {
  small(
    logoSize: 60,
    containerSize: 120,
    particleRadius: 45,
    glowRingSize: 100,
  ),
  medium(
    logoSize: 100,
    containerSize: 200,
    particleRadius: 75,
    glowRingSize: 180,
  ),
  large(
    logoSize: 140,
    containerSize: 280,
    particleRadius: 105,
    glowRingSize: 250,
  );

  const LoadingSize({
    required this.logoSize,
    required this.containerSize,
    required this.particleRadius,
    required this.glowRingSize,
  });

  final double logoSize;
  final double containerSize;
  final double particleRadius;
  final double glowRingSize;
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _particleController;
  late AnimationController _glowController;
  late AnimationController _fadeController;

  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _fadeAnimation;

  static const Color _primaryPurple = Color(0xFF7b4ce0);
  static const Color _darkNavy = Color(0xFF322d78);
  static const Color _coralPink = Color(0xFFf15f6d);
  static const Color _cyan = Color(0xFF22c1e0);

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _particleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _particleController.dispose();
    _glowController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        color: widget.backgroundColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildAnimatedLogo(),
              if (widget.showText) ...[
                SizedBox(height: widget.size == LoadingSize.small ? 16 : 32),
                _buildLoadingIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    final size = widget.size;
    return SizedBox(
      width: size.containerSize.h,
      height: size.containerSize.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildGlowRing(),
          _buildOrbitingParticles(),
          _buildPulsingGlow(),
          _buildLogo(),
        ],
      ),
    );
  }

  Widget _buildGlowRing() {
    final size = widget.size;
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationController.value * 2 * math.pi,
          child: AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: size.glowRingSize,
                height: size.glowRingSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      _cyan.withValues(alpha: 0.0),
                      _cyan.withValues(alpha: _glowAnimation.value * 0.6),
                      _coralPink.withValues(alpha: _glowAnimation.value * 0.6),
                      _primaryPurple.withValues(
                        alpha: _glowAnimation.value * 0.4,
                      ),
                      _cyan.withValues(alpha: 0.0),
                    ],
                    stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildOrbitingParticles() {
    final size = widget.size;
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: List.generate(8, (index) {
            final angle =
                (index * math.pi / 4) +
                (_particleController.value * 2 * math.pi);
            final radius = size.particleRadius;
            final x = math.cos(angle) * radius;
            final y = math.sin(angle) * radius;

            final colors = [_cyan, _coralPink, _primaryPurple, _darkNavy];
            final color = colors[index % colors.length];

            final particleSize =
                (size == LoadingSize.small ? 4.0 : 6.0) +
                (math.sin(angle + _particleController.value * math.pi) *
                    (size == LoadingSize.small ? 2 : 3));

            return Transform.translate(
              offset: Offset(x, y),
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    width: particleSize,
                    height: particleSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: _glowAnimation.value),
                          blurRadius: size == LoadingSize.small ? 8 : 12,
                          spreadRadius: size == LoadingSize.small ? 1 : 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildPulsingGlow() {
    final size = widget.size;
    final glowSize = size.logoSize * 1.2;

    return AnimatedBuilder(
      animation: Listenable.merge([_pulseAnimation, _glowAnimation]),
      builder: (context, child) {
        final scale = _pulseAnimation.value;
        final glowIntensity = _glowAnimation.value;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: glowSize,
            height: glowSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _primaryPurple.withValues(alpha: glowIntensity * 0.5),
                  blurRadius: size == LoadingSize.small ? 25 : 40,
                  spreadRadius: size == LoadingSize.small ? 5 : 10,
                ),
                BoxShadow(
                  color: _cyan.withValues(alpha: glowIntensity * 0.3),
                  blurRadius: size == LoadingSize.small ? 40 : 60,
                  spreadRadius: size == LoadingSize.small ? 10 : 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    final size = widget.size;
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: Container(
            width: size.logoSize.h,
            height: size.logoSize.h,
            padding: EdgeInsets.all(size == LoadingSize.small ? 8 : 12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: _darkNavy.withValues(alpha: 0.3),
                  blurRadius: size == LoadingSize.small ? 12 : 20,
                  spreadRadius: size == LoadingSize.small ? 1 : 2,
                ),
              ],
            ),
            child: AppImage.asset(Assets.images.logo.path, fit: BoxFit.contain),
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    final isSmall = widget.size == LoadingSize.small;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (index) {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 600 + (index * 200)),
                  curve: Curves.easeInOut,
                  builder: (context, value, child) {
                    return AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        final offset =
                            math.sin(
                              (_pulseController.value * math.pi * 2) +
                                  (index * math.pi / 3),
                            ) *
                            (isSmall ? 5 : 8);

                        return Transform.translate(
                          offset: Offset(0, offset),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: isSmall ? 4 : 6,
                            ),
                            width: isSmall ? 8 : 12,
                            height: isSmall ? 8 : 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: [_cyan, _coralPink, _primaryPurple][index],
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      [
                                        _cyan,
                                        _coralPink,
                                        _primaryPurple,
                                      ][index].withValues(
                                        alpha: _glowAnimation.value * 0.6,
                                      ),
                                  blurRadius: isSmall ? 5 : 8,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }),
            ),
            SizedBox(height: isSmall ? 12 : 24),
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    _darkNavy.withValues(alpha: 0.6),
                    _darkNavy,
                    _darkNavy.withValues(alpha: 0.6),
                  ],
                  stops: [
                    (_glowAnimation.value - 0.3).clamp(0.0, 1.0),
                    _glowAnimation.value,
                    (_glowAnimation.value + 0.3).clamp(0.0, 1.0),
                  ],
                ).createShader(bounds);
              },
              child: Text(
                context.localizations.loadingText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isSmall ? 14 : 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
