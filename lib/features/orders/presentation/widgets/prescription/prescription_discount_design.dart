import 'package:animate_do/animate_do.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrescriptionDiscountDesign extends StatefulWidget {
  final TextEditingController controller;
  final bool hasDiscount;
  final bool isLoading;
  final VoidCallback onApply;
  final VoidCallback onRemove;

  const PrescriptionDiscountDesign({
    super.key,
    required this.controller,
    required this.hasDiscount,
    required this.isLoading,
    required this.onApply,
    required this.onRemove,
  });

  @override
  State<PrescriptionDiscountDesign> createState() =>
      _PrescriptionDiscountDesignState();
}

class _PrescriptionDiscountDesignState extends State<PrescriptionDiscountDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _successController;
  late Animation<double> _successAnimation;

  @override
  void initState() {
    super.initState();
    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _successAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _successController, curve: Curves.elasticOut),
    );
  }

  @override
  void didUpdateWidget(PrescriptionDiscountDesign oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasDiscount && !oldWidget.hasDiscount) {
      _successController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _successController.dispose();
    super.dispose();
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
          // Header
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
                  Icons.local_offer_rounded,
                  color: colorScheme.secondary,
                  size: 22,
                ),
              ),
              12.horizontalSpace,
              AppText(
                text: context.localizations.doYouHaveDiscount,
                fontWeight: FontWeight.w600,
                textSize: 12,
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Input Field
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: widget.hasDiscount
                  ? Border.all(
                      color: colorScheme.tertiary.withValues(alpha: 0.5),
                      width: 2,
                    )
                  : null,
            ),
            child: CustomTextFormField(
              controller: widget.controller,
              hintText: context.localizations.doYouHaveDiscountHint,
              prefixIcon: AppImage.asset(Assets.icons.edit2),
              filled: true,
              readOnly: widget.hasDiscount,
              fillColor: widget.hasDiscount
                  ? colorScheme.tertiary.withValues(alpha: 0.05)
                  : colorScheme.surface,
              suffixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(
                  end: 10,
                  top: 4,
                  bottom: 4,
                ),
                child: _buildSuffixButton(context),
              ),
            ),
          ),

          // Success Message
          if (widget.hasDiscount)
            AnimatedBuilder(
              animation: _successAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _successAnimation.value,
                  child: Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.tertiary.withValues(alpha: 0.15),
                          colorScheme.tertiary.withValues(alpha: 0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: colorScheme.tertiary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        ZoomIn(
                          duration: const Duration(milliseconds: 400),
                          delay: const Duration(milliseconds: 200),
                          child: Icon(
                            Icons.check_circle_rounded,
                            color: colorScheme.tertiary,
                            size: 20,
                          ),
                        ),
                        10.horizontalSpace,
                        Expanded(
                          child: AppText(
                            text: context.localizations.discountApplied,
                            textSize: 13,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildSuffixButton(BuildContext context) {
    final colorScheme = context.colorScheme;

    if (widget.hasDiscount) {
      return GestureDetector(
        onTap: widget.onRemove,
        child: ElasticIn(
          duration: const Duration(milliseconds: 400),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: colorScheme.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.close_rounded, size: 16, color: colorScheme.error),
                6.horizontalSpace,
                AppText(
                  text: context.localizations.cancel,
                  color: colorScheme.error,
                  fontWeight: FontWeight.w600,
                  textSize: 12,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return CustomButton(
      textSize: 12,
      radius: 10,
      text: context.localizations.apply,
      isLoading: widget.isLoading,
      press: widget.onApply,
      width: SizeConfig.screenWidth * .22,
    );
  }
}

