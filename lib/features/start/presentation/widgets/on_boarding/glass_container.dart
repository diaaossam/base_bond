import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';

class GlassContainer extends StatelessWidget {
  final double borderRadius;
  final double blur;
  final double opacity;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const GlassContainer({
    super.key,
    this.borderRadius = 16.0,
    this.blur = 8.0,
    this.opacity = 0.12,
    this.child,
    this.padding,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    final defaultShadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 12,
        offset: const Offset(0, 6),
      ),
    ];

    return Container(
      width: double.infinity,
      height: SizeConfig.bodyHeight * 0.3,
      margin: EdgeInsets.all(SizeConfig.screenWidth * .04),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(opacity),
                      Colors.white.withOpacity(opacity * 0.6),
                    ],
                    stops: const [0.0, 1.0],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                child: Container(
                  // هذا Container فارغ فقط ليتم تطبيق الـ BackdropFilter
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border:
                      border ??
                      Border.all(
                        color: Colors.white.withOpacity(0.25),
                        width: 1.0,
                      ),
                  // ظل ناعم
                  boxShadow: boxShadow ?? defaultShadow,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
