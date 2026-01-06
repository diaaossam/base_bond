import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../data/models/insurance_profile_model.dart';

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
          _buildHeaderCard(context),
          24.verticalSpace,

          _buildInfoCard(
            context,
            icon: Icons.business_outlined,
            title: 'شركة التأمين',
            value: profile.companyDisplayName,
          ),
          16.verticalSpace,

          // Insurance Number
          _buildInfoCard(
            context,
            icon: Icons.numbers_outlined,
            title: 'الرقم التأميني',
            value: profile.insuranceNumber ?? 'غير محدد',
          ),
          24.verticalSpace,

          // ID Card Section
          _buildSectionTitle(context, 'البطاقة الشخصية', Icons.credit_card_outlined),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildImageCard(
                  context,
                  title: 'وجه البطاقة',
                  imageUrl: profile.idCardFrontUrl,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _buildImageCard(
                  context,
                  title: 'ظهر البطاقة',
                  imageUrl: profile.idCardBackUrl,
                ),
              ),
            ],
          ),
          24.verticalSpace,

          // Insurance Card Section
          _buildSectionTitle(context, 'بطاقة التأمين', Icons.health_and_safety_outlined),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _buildImageCard(
                  context,
                  title: 'وجه البطاقة',
                  imageUrl: profile.insuranceCardFrontUrl,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _buildImageCard(
                  context,
                  title: 'ظهر البطاقة',
                  imageUrl: profile.insuranceCardBackUrl,
                ),
              ),
            ],
          ),
          32.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colorScheme.primary,
            context.colorScheme.primary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.health_and_safety,
              color: Colors.white,
              size: 40.sp,
            ),
          ),
          16.verticalSpace,
          AppText(
            text: 'الملف التأميني',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            textSize: 20,
          ),
          8.verticalSpace,
          AppText(
            text: profile.companyDisplayName,
            color: Colors.white.withValues(alpha: 0.9),
            textSize: 14,
          ),
          16.verticalSpace,
          InkWell(
            onTap: onEdit,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit_outlined,
                    color: context.colorScheme.primary,
                    size: 18.sp,
                  ),
                  8.horizontalSpace,
                  AppText(
                    text: 'تعديل الملف',
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    textSize: 14,
                  ),
                ],
              ),
            ),
          ),
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
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              icon,
              color: context.colorScheme.primary,
              size: 24.sp,
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: title,
                  textSize: 12,
                  color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
                4.verticalSpace,
                AppText(
                  text: value,
                  fontWeight: FontWeight.w600,
                  textSize: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, IconData icon) {
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
        Icon(
          icon,
          color: context.colorScheme.primary,
          size: 20.sp,
        ),
        8.horizontalSpace,
        AppText.title(
          text: title,
          textSize: 16,
          fontWeight: FontWeight.w600,
        ),
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
                ? Image.asset(
                    'assets/images/person.jpg', // Placeholder since we're using dummy data
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

