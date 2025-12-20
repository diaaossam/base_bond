import 'package:flutter/material.dart';

import '../../../../../../core/extensions/color_extensions.dart';

class BannerIndicatorDesign extends StatelessWidget {
  final int count;
  final int currentIndex;

  const BannerIndicatorDesign({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isActive
                ? context.colorScheme.primary
                : context.colorScheme.primary.withValues(alpha: 0.25),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: context.colorScheme.primary.withValues(alpha: 0.4),
                      blurRadius: 8,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }
}
