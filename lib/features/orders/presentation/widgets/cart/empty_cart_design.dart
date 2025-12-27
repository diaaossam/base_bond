import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartDesign extends StatefulWidget {
  const EmptyCartDesign({super.key});

  @override
  State<EmptyCartDesign> createState() => _EmptyCartDesignState();
}

class _EmptyCartDesignState extends State<EmptyCartDesign>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _fadeController;
  late Animation<double> _floatAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Floating animation for the cart icon
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -8, end: 8).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    // Fade in animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutBack),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _floatController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_fadeController, _floatController]),
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated Cart Icon with floating effect
                    Transform.translate(
                      offset: Offset(0, _floatAnimation.value),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background glow
                          Container(
                            width: SizeConfig.bodyHeight * .25,
                            height: SizeConfig.bodyHeight * .25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: RadialGradient(
                                colors: [
                                  colorScheme.primary.withOpacity(0.15),
                                  colorScheme.primary.withOpacity(0.05),
                                  colorScheme.primary.withOpacity(0),
                                ],
                              ),
                            ),
                          ),

                          // Decorative circles
                          ..._buildDecorativeCircles(colorScheme),

                          // Cart image
                          AppImage.asset(
                            Assets.icons.emptyCart,
                            fit: BoxFit.cover,
                            height: SizeConfig.bodyHeight * .18,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Title
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: AppText(
                        text: context.localizations.noCart,
                        maxLines: 2,
                        fontWeight: FontWeight.w700,
                        textSize: 18,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Subtitle
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: AppText.hint(
                        text: context.localizations.emptyCartHint,
                      ),
                    ),

                    SizedBox(height: 40.h),

                    // Animated arrow hint
                    _buildAnimatedArrowHint(colorScheme),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildDecorativeCircles(ColorScheme colorScheme) {
    return [
      // Top right circle
      Positioned(
        top: 10,
        right: 20,
        child: _AnimatedDot(
          color: colorScheme.primary.withOpacity(0.3),
          size: 12,
          delay: 0,
        ),
      ),
      // Bottom left circle
      Positioned(
        bottom: 20,
        left: 15,
        child: _AnimatedDot(
          color: colorScheme.tertiary.withOpacity(0.3),
          size: 8,
          delay: 300,
        ),
      ),
      // Top left small circle
      Positioned(
        top: 30,
        left: 25,
        child: _AnimatedDot(
          color: colorScheme.secondary.withOpacity(0.2),
          size: 6,
          delay: 600,
        ),
      ),
    ];
  }

  Widget _buildAnimatedArrowHint(ColorScheme colorScheme) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.primary.withOpacity(0.1),
                  colorScheme.primary.withOpacity(0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: colorScheme.primary.withOpacity(0.2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: colorScheme.primary,
                  size: 20,
                ),
                8.horizontalSpace,
                Icon(
                  Icons.arrow_forward_rounded,
                  color: colorScheme.primary,
                  size: 18,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Animated decorative dot
class _AnimatedDot extends StatefulWidget {
  final Color color;
  final double size;
  final int delay;

  const _AnimatedDot({
    required this.color,
    required this.size,
    required this.delay,
  });

  @override
  State<_AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}
