import 'dart:math' as math;
import 'package:flutter/material.dart';

/// A stunning modern loading animation for buttons
/// Features a beautiful animated gradient with orbiting particles
class ModernButtonLoading extends StatefulWidget {
  final Color? primaryColor;
  final Color? secondaryColor;
  final double size;

  const ModernButtonLoading({
    super.key,
    this.primaryColor,
    this.secondaryColor,
    this.size = 28,
  });

  @override
  State<ModernButtonLoading> createState() => _ModernButtonLoadingState();
}

class _ModernButtonLoadingState extends State<ModernButtonLoading>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late AnimationController _particleController;

  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    // Main rotation animation
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    // Pulse animation for the glow effect
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Particle orbit animation
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.primaryColor ?? Colors.white;
    final secondaryColor =
        widget.secondaryColor ?? primaryColor.withAlpha((0.5 * 255).toInt());

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _rotationController,
          _pulseController,
          _particleController,
        ]),
        builder: (context, child) {
          return CustomPaint(
            painter: _ModernLoadingPainter(
              rotationProgress: _rotationController.value,
              pulseProgress: _pulseAnimation.value,
              particleProgress: _particleController.value,
              primaryColor: primaryColor,
              secondaryColor: secondaryColor,
            ),
          );
        },
      ),
    );
  }
}

class _ModernLoadingPainter extends CustomPainter {
  final double rotationProgress;
  final double pulseProgress;
  final double particleProgress;
  final Color primaryColor;
  final Color secondaryColor;

  _ModernLoadingPainter({
    required this.rotationProgress,
    required this.pulseProgress,
    required this.particleProgress,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Draw outer glow
    final glowPaint = Paint()
      ..color = primaryColor.withAlpha((0.2 * pulseProgress * 255).toInt())
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center, radius + 2, glowPaint);

    // Draw main arc with gradient effect
    final arcPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    // Create gradient arc segments
    const segmentCount = 3;
    for (int i = 0; i < segmentCount; i++) {
      final startAngle =
          (rotationProgress * 2 * math.pi) + (i * 2 * math.pi / segmentCount);
      final sweepAngle = math.pi / 3;

      final opacity = 1.0 - (i * 0.25);
      arcPaint.color = primaryColor.withAlpha((opacity * 255).toInt());

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        arcPaint,
      );
    }

    // Draw orbiting particles
    _drawParticles(canvas, center, radius, primaryColor);

    // Draw center dot with pulse
    final centerDotRadius = 2.5 * pulseProgress;
    final centerPaint = Paint()
      ..color = primaryColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
    canvas.drawCircle(center, centerDotRadius, centerPaint);
  }

  void _drawParticles(
      Canvas canvas, Offset center, double radius, Color color) {
    const particleCount = 4;
    final particlePaint = Paint()..color = color;

    for (int i = 0; i < particleCount; i++) {
      final angle = (particleProgress * 2 * math.pi) +
          (i * 2 * math.pi / particleCount) +
          (math.pi / 4);

      // Particles orbit at different radii with oscillation
      final orbitRadius =
          radius * 0.65 + math.sin(particleProgress * math.pi * 2 + i) * 3;

      final particleX = center.dx + orbitRadius * math.cos(angle);
      final particleY = center.dy + orbitRadius * math.sin(angle);

      // Particle size varies with position
      final particleSize =
          1.5 + math.sin(particleProgress * math.pi * 2 + i * 0.5) * 0.8;

      // Particle opacity varies
      final opacity =
          0.4 + math.sin(particleProgress * math.pi * 4 + i * 1.5).abs() * 0.6;
      particlePaint.color = color.withAlpha((opacity * 255).toInt());

      canvas.drawCircle(
        Offset(particleX, particleY),
        particleSize,
        particlePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ModernLoadingPainter oldDelegate) {
    return oldDelegate.rotationProgress != rotationProgress ||
        oldDelegate.pulseProgress != pulseProgress ||
        oldDelegate.particleProgress != particleProgress;
  }
}

/// Alternative: Elegant Wave Dots Loading
class WaveDotsLoading extends StatefulWidget {
  final Color? color;
  final double dotSize;
  final int dotCount;

  const WaveDotsLoading({
    super.key,
    this.color,
    this.dotSize = 6,
    this.dotCount = 4,
  });

  @override
  State<WaveDotsLoading> createState() => _WaveDotsLoadingState();
}

class _WaveDotsLoadingState extends State<WaveDotsLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Colors.white;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.dotCount, (index) {
            // Staggered wave effect
            final delay = index * 0.15;
            final progress = (_controller.value + delay) % 1.0;

            // Smooth wave curve
            final wave = math.sin(progress * math.pi);
            final scale = 0.5 + wave * 0.5;
            final opacity = 0.3 + wave * 0.7;
            final yOffset = -wave * 6;

            return Container(
              margin: EdgeInsets.symmetric(horizontal: widget.dotSize * 0.3),
              child: Transform.translate(
                offset: Offset(0, yOffset),
                child: Transform.scale(
                  scale: scale,
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      color: color.withAlpha((opacity * 255).toInt()),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: color.withAlpha((0.3 * wave * 255).toInt()),
                          blurRadius: 4 * wave,
                          spreadRadius: 1 * wave,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

/// Alternative: Morphing Shape Loading
class MorphingLoading extends StatefulWidget {
  final Color? color;
  final double size;

  const MorphingLoading({
    super.key,
    this.color,
    this.size = 32,
  });

  @override
  State<MorphingLoading> createState() => _MorphingLoadingState();
}

class _MorphingLoadingState extends State<MorphingLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Colors.white;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _MorphingPainter(
              progress: _controller.value,
              color: color,
            ),
          );
        },
      ),
    );
  }
}

class _MorphingPainter extends CustomPainter {
  final double progress;
  final Color color;

  _MorphingPainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2 - 2;

    // Create morphing effect with multiple shapes
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    // Draw 3 morphing arcs
    for (int i = 0; i < 3; i++) {
      final phaseOffset = i * (2 * math.pi / 3);
      final localProgress = (progress + i * 0.1) % 1.0;

      // Arc parameters morph over time
      final startAngle =
          localProgress * 2 * math.pi + phaseOffset + math.sin(progress * 4) * 0.5;
      final sweepAngle =
          (math.pi / 2) + math.sin(progress * 2 * math.pi + i) * (math.pi / 4);
      final radius =
          maxRadius * (0.7 + 0.3 * math.sin(progress * 2 * math.pi + i * 2));

      final opacity = 0.4 + 0.6 * math.sin(progress * math.pi * 2 + i).abs();
      paint.color = color.withAlpha((opacity * 255).toInt());

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }

    // Pulsing center
    final pulseRadius = 2 + math.sin(progress * math.pi * 4) * 1.5;
    final centerPaint = Paint()
      ..color = color.withAlpha((0.8 * 255).toInt())
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);
    canvas.drawCircle(center, pulseRadius, centerPaint);
  }

  @override
  bool shouldRepaint(covariant _MorphingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
















