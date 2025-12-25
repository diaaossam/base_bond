import 'package:bond/core/enum/payment_type.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_size.dart';
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

class _PaymentTypeDesignState extends State<PaymentTypeDesign> {
  PaymentType? _selectedPayment;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .02,
            vertical: SizeConfig.bodyHeight * .02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: context.localizations.paymentType,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: SizeConfig.bodyHeight * .02,
            ),
            buildPaymentType(
                isSelected: _selectedPayment == PaymentType.cash,
                context: context,
                image: Assets.images.coins01.path,
                payment: PaymentType.cash),
            SizedBox(
              height: SizeConfig.bodyHeight * .02,
            ),
            // TODO: Add zainCash payment type when available
            // buildPaymentType(
            //     isSelected: _selectedPayment == PaymentType.zainCash,
            //     context: context,
            //     image: Assets.images.zainCash.path,
            //     payment: PaymentType.zainCash),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentType(
      {required bool isSelected,
      required PaymentType payment,
      required BuildContext context,
      required String image}) {
    return InkWell(
      onTap: () async{
        if (ApiConfig.isGuest == true) {
          SettingsHelper().showGuestDialog(context,isFromCart: true);
          return;
        }
        widget.payment(payment);
        setState(() => _selectedPayment = payment);
      },
      child: Padding(
        padding: screenPadding(),
        child: Row(
          children: [
            Container(
              height: SizeConfig.bodyHeight * .025,
              width: SizeConfig.bodyHeight * .025,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: context.colorScheme.primary, width: 4)
                      : null),
              child: AppImage.asset(Assets.icons.tickCircle),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * .03,
                      vertical: SizeConfig.bodyHeight * .025),
                  decoration: BoxDecoration(
                      color: isSelected
                          ? context.colorScheme.onPrimary
                          : context.colorScheme.background,
                      border: Border.all(
                          width: 2,
                          color: isSelected
                              ? context.colorScheme.primary
                              : context.colorScheme.outline),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      AppImage.asset(
                        image,
                        height: 30,
                      ),
                      SizedBox(width: 10.w),
                      AppText(
                        text: handlePaymentTypeToString(payment: payment),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
