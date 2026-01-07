import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/color_extensions.dart';
import '../../../../../../widgets/main_widget/app_text.dart';

class DeliveryOption extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<DeliveryOption> createState() => DeliveryOptionState();
}

class DeliveryOptionState extends State<DeliveryOption>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return GestureDetector(
      onTapDown: (_) => _bounceController.forward(),
      onTapUp: (_) {
        _bounceController.reverse();
        widget.onTap();
      },
      onTapCancel: () => _bounceController.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
          decoration: BoxDecoration(
            gradient: widget.isSelected
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary.withValues(alpha: 0.15),
                      colorScheme.primary.withValues(alpha: 0.05),
                    ],
                  )
                : null,
            color: widget.isSelected ? null : colorScheme.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              width: widget.isSelected ? 2 : 1.5,
              color: widget.isSelected
                  ? colorScheme.primary
                  : colorScheme.outline,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  gradient: widget.isSelected
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.primary,
                            colorScheme.primary.withValues(alpha: 0.7),
                          ],
                        )
                      : null,
                  color: widget.isSelected
                      ? null
                      : colorScheme.shadow.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                  boxShadow: widget.isSelected
                      ? [
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Icon(
                  widget.icon,
                  size: 18,
                  color: widget.isSelected ? Colors.white : colorScheme.shadow,
                ),
              ),
              SizedBox(height: 8.h),
              AppText(
                text: widget.label,
                textSize: 10,
                fontWeight: widget.isSelected
                    ? FontWeight.w600
                    : FontWeight.w500,
                color: widget.isSelected
                    ? colorScheme.primary
                    : colorScheme.shadow,
                align: TextAlign.center,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
