import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: context.localizations.ourServices),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: ServiceCard(
                      icon: Assets.icons.insuranceCompany,
                      label: context.localizations.orderWithYourInsurance,
                      onTap: () => context.router.push(PrescriptionRoute(isInsurance: true)),
                      color: const Color(0xFF3B82F6),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 100),
                    child: ServiceCard(
                      icon: Assets.icons.insuranceProfile,
                      label: context.localizations.prescriptionOrder,
                      onTap: () => context.router.push(PrescriptionRoute(isInsurance: false)),
                      color: context.colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * 0.02),
        ],
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        decoration: BoxDecoration(
            color: widget.color.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: widget.color,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: 0.1),
              blurRadius: 15,
              offset: const Offset(0, 5),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: AppImage.asset(
                widget.icon,
                size: 20.h,
                color: widget.color,
              ),
            ),
            SizedBox(height: 10.h),
            AppText(
              text: widget.label,
              textSize: 10,
              maxLines: 2,
              align: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
