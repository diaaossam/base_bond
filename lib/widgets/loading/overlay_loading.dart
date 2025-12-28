import 'dart:math' as math;
import 'dart:ui';

import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../gen/assets.gen.dart';

/// A stunning modern loading overlay with beautiful animations
/// Uses the app logo with pulsing, rotating glow, and orbiting particles
class OverlayLoading {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  /// Shows the loading overlay with amazing animations
  static void show(BuildContext context) {
    if (_isShowing) return;
    _isShowing = true;
    _overlayEntry = OverlayEntry(
      builder: (context) => const _LoadingOverlayWidget(),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  /// Hides the loading overlay with a smooth fade out
  static void hide() {
    if (!_isShowing) return;
    _isShowing = false;

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// Check if loading is currently showing
  static bool get isShowing => _isShowing;
}

class _LoadingOverlayWidget extends StatefulWidget {
  const _LoadingOverlayWidget();

  @override
  State<_LoadingOverlayWidget> createState() => _LoadingOverlayWidgetState();
}

class _LoadingOverlayWidgetState extends State<_LoadingOverlayWidget>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _particleController;
  late AnimationController _glowController;
  late AnimationController _fadeController;

  // Animations
  late Animation<double> _pulseAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _fadeAnimation;

  // Brand colors from logo
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
    // Fade in animation
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();

    // Pulse animation for logo breathing effect
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Rotation for particles
    _rotationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    // Particle orbit animation
    _particleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Glow intensity animation
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
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            _buildGlassBackground(),
            // Main content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAnimatedLogo(),
                  const SizedBox(height: 32),
                  _buildLoadingIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGlassBackground() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _darkNavy.withValues(alpha: 0.2),
              _primaryPurple.withValues(alpha: 0.75),
              _darkNavy.withValues(alpha: 0.9),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return SizedBox(
      width: 200.h,
      height: 200.h,
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
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationController.value * 2 * math.pi,
          child: AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return Container(
                width: 180,
                height: 180,
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
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: List.generate(8, (index) {
            final angle =
                (index * math.pi / 4) +
                (_particleController.value * 2 * math.pi);
            final radius = 75.0;
            final x = math.cos(angle) * radius;
            final y = math.sin(angle) * radius;

            // Alternate colors
            final colors = [_cyan, _coralPink, _primaryPurple, _darkNavy];
            final color = colors[index % colors.length];

            // Size variation based on position
            final size =
                6.0 +
                (math.sin(angle + _particleController.value * math.pi) * 3);

            return Transform.translate(
              offset: Offset(x, y),
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: _glowAnimation.value),
                          blurRadius: 12,
                          spreadRadius: 2,
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
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseAnimation, _glowAnimation]),
      builder: (context, child) {
        final scale = _pulseAnimation.value;
        final glowIntensity = _glowAnimation.value;

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: _primaryPurple.withValues(alpha: glowIntensity * 0.5),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
                BoxShadow(
                  color: _cyan.withValues(alpha: glowIntensity * 0.3),
                  blurRadius: 60,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLogo() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnimation.value,
          child: Container(
            width: 100.h,
            height: 100.h,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: _darkNavy.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
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
                        // Stagger the animation for each dot
                        final offset =
                            math.sin(
                              (_pulseController.value * math.pi * 2) +
                                  (index * math.pi / 3),
                            ) *
                            8;

                        return Transform.translate(
                          offset: Offset(0, offset),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            width: 12,
                            height: 12,
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
                                  blurRadius: 8,
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
            const SizedBox(height: 24),
            ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                  colors: [
                    Colors.white.withValues(alpha: 0.6),
                    Colors.white,
                    Colors.white.withValues(alpha: 0.6),
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
                  fontSize: 18,
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
