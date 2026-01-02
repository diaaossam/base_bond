import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/presentation/cubit/prescription/prescription_state_data.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/section_header.dart';

class OurServicesDesign extends StatefulWidget {
  const OurServicesDesign({super.key});

  @override
  State<OurServicesDesign> createState() => _OurServicesDesignState();
}

class _OurServicesDesignState extends State<OurServicesDesign> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SectionHeader(title: context.localizations.ourServices),
          Row(
            children: [
              DeliveryOption(
                icon: Assets.icons.insuranceCompany,
                label: context.localizations.orderWithYourInsurance,
                onTap: () =>context.router.push(PrescriptionRoute()),
              ),
              DeliveryOption(
                icon: Assets.icons.insuranceProfile,
                label: context.localizations.prescriptionOrder,
                onTap: () =>context.router.push(PrescriptionRoute()),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight*.02,),
        ],
      ),
    );
  }
}

class DeliveryOption extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const DeliveryOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: screenPadding(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colorScheme.primary),
            color: context.colorScheme.surfaceContainer,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 0,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              AppImage.asset(icon,size: 30.h,color: context.colorScheme.primary,),
              SizedBox(height: 10.h),
              AppText(
                text: label,
                textSize: 11,
                fontWeight: FontWeight.w500,
                color: colorScheme.shadow,
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
