import 'package:bond/core/enum/payment_type.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentTypeDesign extends StatefulWidget {
  final Function(PaymentType) payment;

  const PaymentTypeDesign({super.key, required this.payment});

  @override
  State<PaymentTypeDesign> createState() => _PaymentTypeDesignState();
}

class _PaymentTypeDesignState extends State<PaymentTypeDesign>
    with SingleTickerProviderStateMixin {
  PaymentType _selectedPayment = PaymentType.cash;



  void _selectPayment(PaymentType payment) {
    if (ApiConfig.isGuest == true) {
      SettingsHelper().showGuestDialog(context, isFromCart: true);
      return;
    }
    widget.payment(payment);
    setState(() => _selectedPayment = payment);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return SliverToBoxAdapter(
      child: Container(
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
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            // Header
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.payment_rounded,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ),
                12.horizontalSpace,
                AppText(
                  text: context.localizations.paymentType,
                  fontWeight: FontWeight.w700,
                  textSize: 12,
                ),
              ],
            ),
            SizedBox(height: 12.h),
            _PaymentOption(
              isSelected: _selectedPayment == PaymentType.cash,
              payment: PaymentType.cash,
              image: Assets.images.coins01.path,
              onTap: () => _selectPayment(PaymentType.cash),
            ),
            SizedBox(height: 5.h),
            _PaymentOption(
              isSelected: _selectedPayment == PaymentType.visa,
              payment: PaymentType.visa,
              image: Assets.images.visamaster.path,
              onTap: () => _selectPayment(PaymentType.visa),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentOption extends StatefulWidget {
  final bool isSelected;
  final PaymentType payment;
  final String image;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.isSelected,
    required this.payment,
    required this.image,
    required this.onTap,
  });

  @override
  State<_PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<_PaymentOption> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          gradient: widget.isSelected
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.12),
                    colorScheme.primary.withValues(alpha: 0.04),
                  ],
                )
              : null,
          color: widget.isSelected ? null : colorScheme.background,
          border: Border.all(
            width: widget.isSelected ? 2 : 1.5,
            color: widget.isSelected
                ? colorScheme.primary
                : colorScheme.outline.withValues(alpha: 0.5),
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                    color: colorScheme.primary.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: AppImage.asset(widget.image, height: 20, width: 20),
            ),
            12.horizontalSpace,
            Expanded(
              child: AppText(
                text: handlePaymentTypeToString(payment: widget.payment),
                fontWeight: widget.isSelected
                    ? FontWeight.w600
                    : FontWeight.w500,
                textSize: 12,
                color: widget.isSelected
                    ? colorScheme.primary
                    : colorScheme.onSurface,
              ),
            ),

            if (widget.isSelected)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText(
                  text: "✓",
                  textSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
