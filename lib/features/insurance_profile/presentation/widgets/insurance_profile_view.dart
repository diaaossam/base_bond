import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/insurance_profile_model.dart';
import 'insurance_header_info.dart';

class InsuranceProfileView extends StatelessWidget {
  final InsuranceProfileModel profile;
  final VoidCallback onEdit;

  const InsuranceProfileView({
    super.key,
    required this.profile,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Card
          InsuranceHeaderInfo(onEdit: onEdit,model: profile,),
          5.verticalSpace,

          _buildInfoCard(
            context,
            icon: Icons.business_outlined,
            title: context.localizations.insuranceCompany,
            value: profile.insuranceCompany?.title ?? "",
          ),
          _buildInfoCard(
            context,
            icon: Icons.numbers_outlined,
            title: context.localizations.insuranceNumber,
            value: profile.notes ?? '',
          ),
          5.verticalSpace,

          // ID Card Section
          _buildSectionTitle(
            context,
            context.localizations.nationalId,
            Icons.credit_card_outlined,
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildImageCard(
                  context,
                  title: context.localizations.id_card_front_title,
                  imageUrl: profile.idCardFront,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _buildImageCard(
                  context,
                  title: context.localizations.id_card_back_title,
                  imageUrl: profile.idCardBack,
                ),
              ),
            ],
          ),
          24.verticalSpace,

          // Insurance Card Section
          _buildSectionTitle(
            context,
            context.localizations.insuranceCard,
            Icons.health_and_safety_outlined,
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildImageCard(
                  context,
                  title: context.localizations.insurance_card_front_title,
                  imageUrl: profile.insuranceCardFront,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _buildImageCard(
                  context,
                  title: context.localizations.insurance_card_back_title,
                  imageUrl: profile.insuranceCardBack,
                ),
              ),
            ],
          ),
          32.verticalSpace,
        ],
      ),
    );
  }


  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: context.colorScheme.primary, size: 24.sp),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  textSize: 10,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                4.verticalSpace,
                AppText(text: value, fontWeight: FontWeight.w600, textSize: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, IconData icon) {
    return Row(
      children: [
        Container(
          width: 4.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        10.horizontalSpace,
        Icon(icon, color: context.colorScheme.primary, size: 20.sp),
        8.horizontalSpace,
        AppText.title(text: title, textSize: 12, fontWeight: FontWeight.w600),
      ],
    );
  }

  Widget _buildImageCard(
    BuildContext context, {
    required String title,
    String? imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
            child: imageUrl != null
                ? Image.network(
                    imageUrl,
                    // Placeholder since we're using dummy data
                    height: 100.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _buildPlaceholder(context),
                  )
                : _buildPlaceholder(context),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: AppText(
              text: title,
              textSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      height: 100.h,
      color: context.colorScheme.outline.withValues(alpha: 0.1),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: context.colorScheme.outline,
          size: 32.sp,
        ),
      ),
    );
  }
}
