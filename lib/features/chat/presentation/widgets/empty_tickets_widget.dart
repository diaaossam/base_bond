import 'dart:math' as math;
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyTicketsWidget extends StatefulWidget {
  const EmptyTicketsWidget({super.key});

  @override
  State<EmptyTicketsWidget> createState() => _EmptyTicketsWidgetState();
}

class _EmptyTicketsWidgetState extends State<EmptyTicketsWidget>
    with TickerProviderStateMixin {
  late AnimationController _floatController;
  late AnimationController _pulseController;
  late Animation<double> _floatAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: Listenable.merge([_floatAnimation, _pulseAnimation]),
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _floatAnimation.value),
                  child: Transform.scale(
                    scale: _pulseAnimation.value,
                    child: _buildIllustration(context),
                  ),
                );
              },
            ),
            SizedBox(height: 32.h),
            AppText.title(
              text: context.localizations.noTicketsTitle,
              textSize: 20,
              align: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            AppText.hint(
              text: context.localizations.noTicketsBody,
              textSize: 14,
              align: TextAlign.center,
              maxLines: 3,
            ),
            SizedBox(height: 32.h),
            _buildHintCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIllustration(BuildContext context) {
    return Container(
      width: 180.w,
      height: 180.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            context.colorScheme.primary.withValues(alpha: 0.1),
            context.colorScheme.primary.withValues(alpha: 0.05),
            Colors.transparent,
          ],
          stops: const [0.3, 0.6, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Orbiting dots
          ...List.generate(6, (index) {
            final angle = (index * math.pi / 3) + (_floatController.value * math.pi * 0.1);
            final radius = 70.w;
            return Positioned(
              left: 90.w + math.cos(angle) * radius - 4.w,
              top: 90.w + math.sin(angle) * radius - 4.w,
              child: Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.primary.withValues(alpha: 0.3 + (index * 0.1)),
                ),
              ),
            );
          }),
          // Main icon
          Container(
            padding: EdgeInsets.all(24.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(
              Icons.support_agent_rounded,
              size: 64.sp,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHintCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: context.colorScheme.primary.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.lightbulb_outline_rounded,
              color: context.colorScheme.primary,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: AppText.body(
              text: context.localizations.createTicketHint,
              textSize: 12,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}




