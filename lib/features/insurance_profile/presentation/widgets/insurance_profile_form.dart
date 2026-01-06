import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/insurance_profile/presentation/widgets/section_title_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import '../cubit/insurance_profile_cubit.dart';
import '../cubit/insurance_profile_state_data.dart';
import 'image_upload_card.dart';
import 'insurance_company_selector.dart';

class InsuranceProfileForm extends StatefulWidget {
  final bool isEditing;
  final VoidCallback onSuccess;

  const InsuranceProfileForm({
    super.key,
    this.isEditing = false,
    required this.onSuccess,
  });

  @override
  State<InsuranceProfileForm> createState() => _InsuranceProfileFormState();
}

class _InsuranceProfileFormState extends State<InsuranceProfileForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      InsuranceProfileCubit,
      BaseState<InsuranceProfileStateData>
    >(
      builder: (context, state) {
        final data = state.data ?? const InsuranceProfileStateData();
        final isSubmitting =
            state.isLoading &&
            (state.identifier == 'create' || state.identifier == 'update');

        return FadeTransition(
          opacity: _fadeAnimation,
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: screenPadding(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  InsuranceCompanySelector(
                    companies: data.insuranceCompanies,
                    selectedCompany: data.selectedCompany,
                    customCompanyName: data.customCompanyName,
                    isLoading: state.isLoading && state.identifier == 'companies',
                  ),
                  24.verticalSpace,
                  SectionTitleDesign(title: context.localizations.insuranceNumber, icon:Icons.numbers_outlined),
                  16.verticalSpace,
                  CustomTextFormField(
                    name: 'insurance_number',
                    hintText: context.localizations.enterInsuranceNumber,
                    initialValue: data.insuranceNumber,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.required(errorText: context.localizations.validation),
                    prefixIcon: Container(
                      margin: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.badge_outlined,
                        color: context.colorScheme.primary,
                        size: 14.sp,
                      ),
                    ),
                  ),
                  16.verticalSpace,
                  _buildIdCardSection(context, data),
                  24.verticalSpace,
                  _buildInsuranceCardSection(context, data),

                  32.verticalSpace,

                  // Submit Button
                  CustomButton(
                    text: widget.isEditing ? 'تحديث الملف' : 'إنشاء الملف',
                    isLoading: isSubmitting,
                    press: () => _onSubmit(context),
                  ),

                  24.verticalSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  Widget _buildIdCardSection(
    BuildContext context,
    InsuranceProfileStateData data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'البطاقة الشخصية',
          Icons.credit_card_outlined,
        ),
        16.verticalSpace,
        ImageUploadCard(
          title: 'وجه البطاقة',
          hint: 'اضغط لتصوير وجه البطاقة الشخصية',
          selectedFile: data.idCardFront,
          existingImageUrl: data.profile?.idCardFrontUrl,
          icon: Icons.credit_card,
          onImageSelected: (file) {
            context.read<InsuranceProfileCubit>().setIdCardFront(file);
          },
        ),
        12.verticalSpace,
        ImageUploadCard(
          title: 'ظهر البطاقة',
          hint: 'اضغط لتصوير ظهر البطاقة الشخصية',
          selectedFile: data.idCardBack,
          existingImageUrl: data.profile?.idCardBackUrl,
          icon: Icons.credit_card,
          onImageSelected: (file) {
            context.read<InsuranceProfileCubit>().setIdCardBack(file);
          },
        ),
      ],
    );
  }

  Widget _buildInsuranceCardSection(
    BuildContext context,
    InsuranceProfileStateData data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(
          context,
          'بطاقة التأمين',
          Icons.health_and_safety_outlined,
        ),
        16.verticalSpace,
        ImageUploadCard(
          title: 'وجه بطاقة التأمين',
          hint: 'اضغط لتصوير وجه بطاقة التأمين',
          selectedFile: data.insuranceCardFront,
          existingImageUrl: data.profile?.insuranceCardFrontUrl,
          icon: Icons.health_and_safety,
          onImageSelected: (file) {
            context.read<InsuranceProfileCubit>().setInsuranceCardFront(file);
          },
        ),
        12.verticalSpace,
        ImageUploadCard(
          title: 'ظهر بطاقة التأمين',
          hint: 'اضغط لتصوير ظهر بطاقة التأمين',
          selectedFile: data.insuranceCardBack,
          existingImageUrl: data.profile?.insuranceCardBackUrl,
          icon: Icons.health_and_safety,
          onImageSelected: (file) {
            context.read<InsuranceProfileCubit>().setInsuranceCardBack(file);
          },
        ),
      ],
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
        AppText.title(text: title, textSize: 16, fontWeight: FontWeight.w600),
      ],
    );
  }

  Future<void> _onSubmit(BuildContext context) async {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final cubit = context.read<InsuranceProfileCubit>();
      bool success;

      if (widget.isEditing) {
        success = await cubit.updateProfile();
      } else {
        success = await cubit.createProfile();
      }

      if (success) {
        widget.onSuccess();
      }
    }
  }
}
