import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSuccessDialog extends StatefulWidget {
  final Orders order;

  const OrderSuccessDialog({super.key, required this.order});

  static Future<void> show({
    required BuildContext context,
    required Orders order,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return OrderSuccessDialog(order: order);
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
          ),
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }

  @override
  State<OrderSuccessDialog> createState() => _OrderSuccessDialogState();
}

class _OrderSuccessDialogState extends State<OrderSuccessDialog>
    with TickerProviderStateMixin {
  late AnimationController _checkController;
  late AnimationController _confettiController;
  late AnimationController _contentController;
  late Animation<double> _checkScale;
  late Animation<double> _checkRotation;
  late Animation<double> _ringScale;
  late Animation<double> _contentSlide;
  late Animation<double> _contentFade;

  final List<_ConfettiParticle> _particles = [];
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

    _checkScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.3), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 0.9), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 40),
    ]).animate(CurvedAnimation(
      parent: _checkController,
      curve: Curves.easeOut,
    ));

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
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeOutCubic,
      ),
    );

    _contentFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _contentController,
        curve: Curves.easeOut,
      ),
    );
  }

  void _generateConfetti() {
    for (int i = 0; i < 50; i++) {
      _particles.add(_ConfettiParticle(
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
      ));
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
                painter: _ConfettiPainter(
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
                    color: context.colorScheme.primary.withOpacity(0.2),
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
                    // Success animation header
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
            context.colorScheme.primary.withOpacity(0.8),
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
                      color: Colors.white.withOpacity(0.2),
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
                      color: Colors.white.withOpacity(0.3),
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
                          color: Colors.black.withOpacity(0.1),
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
        offset: Offset(
          cos(angle) * distance,
          sin(angle) * distance,
        ),
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
                  color: Colors.white.withOpacity(0.5),
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
                  24.verticalSpace,
                  // Order info card
                  _buildOrderInfoCard(context),
                  32.verticalSpace,
                  // Buttons
                  _buildButtons(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildOrderInfoCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.receipt_long_rounded,
                  color: context.colorScheme.primary,
                  size: 16.sp,
                ),
              ),
              5.horizontalSpace,
              AppText(
                text: '#${widget.order.orderNumber ?? ''}',
                textSize: 11,
                fontWeight: FontWeight.w600,
                color: context.colorScheme.primary,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText.hint(
                text: context.localizations.totalPrice,
                textSize: 10,
              ),
              4.verticalSpace,
              Row(
                children: [
                  AppText(
                    text: widget.order.total?.toStringAsFixed(0) ?? '0',
                    textSize: 16,
                    fontWeight: FontWeight.w800,
                    color: context.colorScheme.primary,
                  ),
                  4.horizontalSpace,
                  AppText(
                    text: context.localizations.egp,
                    textSize: 12,
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.primary.withOpacity(0.7),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        // Track Order Button
        CustomButton(
          text: context.localizations.trackOrder,
          press: () {
            Navigator.of(context).pop();
            context.router.pushAndPopUntil(
              MainLayoutRoute(),
              predicate: (route) => false,
            );
            context.router.push(OrderDetailsRoute(order: widget.order));
          },
        ),
        12.verticalSpace,
        // Go to Home Button
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
    );
  }
}

class _ConfettiParticle {
  double x;
  double y;
  final double size;
  final Color color;
  final double speed;
  double rotation;
  final double rotationSpeed;
  final double swayAmplitude;
  final double swaySpeed;

  _ConfettiParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.speed,
    required this.rotation,
    required this.rotationSpeed,
    required this.swayAmplitude,
    required this.swaySpeed,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({
    required this.particles,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      // Update position
      final currentY = particle.y + progress * particle.speed * 2;
      if (currentY > 1.2) continue;

      final sway = sin(progress * particle.swaySpeed * 2 * pi) * particle.swayAmplitude;
      final currentX = particle.x + sway;
      final currentRotation = particle.rotation + progress * particle.rotationSpeed * 4 * pi;

      // Draw particle
      final paint = Paint()
        ..color = particle.color.withOpacity((1 - currentY).clamp(0, 1))
        ..style = PaintingStyle.fill;

      canvas.save();
      canvas.translate(currentX * size.width, currentY * size.height);
      canvas.rotate(currentRotation);

      // Draw rectangle confetti
      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset.zero,
          width: particle.size,
          height: particle.size * 0.6,
        ),
        Radius.circular(2),
      );
      canvas.drawRRect(rect, paint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) => true;
}



