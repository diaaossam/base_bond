import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/insurance_profile/presentation/widgets/section_title_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../widgets/main_widget/app_text.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InsuranceCompanySelector extends StatelessWidget {
  final List<GenericModel> companies;
  final GenericModel? selectedCompany;
  final String? customCompanyName;
  final bool isLoading;

  const InsuranceCompanySelector({
    super.key,
    required this.companies,
    this.selectedCompany,
    this.customCompanyName,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitleDesign(title: context.localizations.insuranceCompany,icon: Icons.business_outlined,),
        12.verticalSpace,
        AppDropDown<GenericModel>(
          name: 'insurance_company',
          hint: context.localizations.selectInsuranceCompany,
          initialValue: selectedCompany,
          validator:  FormBuilderValidators.required(
            errorText: context.localizations.validation,
          ),
          items: companies.map((company) => DropdownMenuItem(
              value: company,
              child: AppText(text: company.title ?? ''),
            ),
          ).toList(),
         isLoading: isLoading,
        ),
        if (_isOtherSelected) ...[
          12.verticalSpace,
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CustomTextFormField(
              name: 'custom_company_name',
              hintText: context.localizations.enterCustomCompanyName,
              initialValue: customCompanyName,
              prefixIcon: Container(
                margin: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: context.colorScheme.primary,
                  size: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  bool get _isOtherSelected => selectedCompany?.id == -1;

}
