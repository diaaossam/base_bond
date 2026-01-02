import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/orders/presentation/cubit/prescription/prescription_state_data.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryMethodDesign extends StatefulWidget {
  final DeliveryMethod selectedMethod;
  final Function(DeliveryMethod) onMethodChanged;

  const DeliveryMethodDesign({
    super.key,
    required this.selectedMethod,
    required this.onMethodChanged,
  });

  @override
  State<DeliveryMethodDesign> createState() => _DeliveryMethodDesignState();
}

class _DeliveryMethodDesignState extends State<DeliveryMethodDesign> {

  void _selectMethod(DeliveryMethod method) {
    widget.onMethodChanged(method);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.secondary.withValues(alpha: 0.15),
                      colorScheme.secondary.withValues(alpha: 0.08),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.local_shipping_rounded,
                  color: colorScheme.secondary,
                  size: 22,
                ),
              ),
              12.horizontalSpace,
              AppText(
                text: context.localizations.deliveryMethod,
                fontWeight: FontWeight.w700,
                textSize: 12,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _DeliveryOption(
                icon: Icons.store_rounded,
                label: context.localizations.pharmacyPickup,
                isSelected: widget.selectedMethod == DeliveryMethod.pharmacy,
                onTap: () => _selectMethod(DeliveryMethod.pharmacy),
              ),
              12.horizontalSpace,
              _DeliveryOption(
                icon: Icons.home_rounded,
                label: context.localizations.homeDelivery,
                isSelected: widget.selectedMethod == DeliveryMethod.delivery,
                onTap: () => _selectMethod(DeliveryMethod.delivery),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




class _DeliveryOption extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DeliveryOption({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_DeliveryOption> createState() => _DeliveryOptionState();
}

class _DeliveryOptionState extends State<_DeliveryOption>
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

    return Expanded(
      child: GestureDetector(
        onTapDown: (_) => _bounceController.forward(),
        onTapUp: (_) {
          _bounceController.reverse();
          widget.onTap();
        },
        onTapCancel: () => _bounceController.reverse(),
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
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
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: widget.isSelected ? 2 : 1.5,
                color: widget.isSelected
                    ? colorScheme.primary
                    : colorScheme.outline.withValues(alpha: 0.3),
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
                // Icon with animated background
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: EdgeInsets.all(12.w),
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
                    size: 24,
                    color: widget.isSelected ? Colors.white : colorScheme.shadow,
                  ),
                ),
                SizedBox(height: 10.h),
      
                // Label
                AppText(
                  text: widget.label,
                  textSize: 11,
                  fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
                  color:
                      widget.isSelected ? colorScheme.primary : colorScheme.shadow,
                  align: TextAlign.center,
                  maxLines: 2,
                ),
      
                // Selection indicator
                if (widget.isSelected) ...[
                  SizedBox(height: 8.h),
                  ZoomIn(
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.check_rounded,
                            color: Colors.white,
                            size: 12,
                          ),
                          4.horizontalSpace,
                          AppText(
                            text: '✓',
                            textSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

