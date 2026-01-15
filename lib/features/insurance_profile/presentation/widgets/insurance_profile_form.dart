import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:bond/features/insurance_profile/presentation/widgets/section_title_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/custom_button.dart';
import '../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../data/models/insurance_profile_params.dart';
import '../cubit/insurance_profile_cubit.dart';
import '../cubit/insurance_profile_state_data.dart';
import 'image_upload_card.dart';
import 'insurance_company_selector.dart';

class InsuranceProfileForm extends StatefulWidget {
  final InsuranceProfileModel? insuranceProfileModel;

  const InsuranceProfileForm({super.key, this.insuranceProfileModel});

  @override
  State<InsuranceProfileForm> createState() => _InsuranceProfileFormState();
}

class _InsuranceProfileFormState extends State<InsuranceProfileForm>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  
  GenericModel ? selectedInsuranceCompany;
  File? _idCardFrontFile,
      _idCardBackFile,
      _insuranceCardFrontFile,
      _insuranceCardBackFile;

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
                    onChanged: (data) => context.read<InsuranceProfileCubit>().selectCompany(model: data!),
                    customCompanyName: data.customCompanyName,
                    isLoading: state.isLoading && state.identifier == 'companies',
                  ),
                  24.verticalSpace,
                  SectionTitleDesign(
                    title: context.localizations.insuranceNumber,
                    icon: Icons.numbers_outlined,
                  ),
                  16.verticalSpace,
                  CustomTextFormField(
                    name: 'insurance_number',
                    hintText: context.localizations.enterInsuranceNumber,
                    initialValue: data.insuranceNumber,
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                    prefixIcon: Container(
                      margin: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary.withValues(
                          alpha: 0.1,
                        ),
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
                  BlocConsumer<
                    InsuranceProfileCubit,
                    BaseState<InsuranceProfileStateData>
                  >(
                    listener: (context, state) {
                      if (state.isSuccess &&
                          (state.identifier == 'create' ||
                              state.identifier == 'update')) {
                        context.router.pop(true);
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: widget.insuranceProfileModel == null
                            ? context.localizations.createFile
                            : context.localizations.editFile,
                        isLoading: isSubmitting,
                        press: () async {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final insuranceCompany =
                                _formKey.fieldValue('insurance_company')
                                    as GenericModel?;
                            final insuranceNumber =
                                _formKey.fieldValue('insurance_number')
                                    as String?;
                            final insuranceCardFront =
                                _formKey.fieldValue('insurance_card_front')
                                    as File?;
                            final insuranceCardBack =
                                _formKey.fieldValue('insurance_card_back')
                                    as File?;
                            final idCardFront =
                                _formKey.fieldValue('id_card_front') as File?;
                            final idCardBack = _formKey.fieldValue('id_card_back') as File?;
                            final String ? companyName = _formKey.fieldValue('custom_company_name') as String?;

                            InsuranceProfileRequest params =
                                InsuranceProfileRequest(
                                  insuranceCompanyId: insuranceCompany?.id ?? 0,
                                  insuranceNumber: insuranceNumber,
                                  insuranceCardFront: insuranceCardFront,
                                  insuranceCardBack: insuranceCardBack,
                                  idCardFront: idCardFront,
                                  companyName: companyName,
                                  idCardBack: idCardBack,
                                );

                            final cubit = context.read<InsuranceProfileCubit>();
                            if (widget.insuranceProfileModel?.id != null) {
                              // Update mode
                              await cubit.updateProfile(
                                id: widget.insuranceProfileModel!.id!,
                                params: params,
                              );
                            } else {
                              if (insuranceCardFront == null ||
                                  insuranceCardBack == null ||
                                  idCardFront == null ||
                                  idCardBack == null) {
                                AppConstant.showCustomSnakeBar(
                                  context,
                                  context.localizations.validation,
                                  false,
                                );
                                return;
                              }
                              await cubit.createProfile(params: params);
                            }
                          }
                        },
                      );
                    },
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
        SectionTitleDesign(
          title: context.localizations.nationalId,
          icon: Icons.credit_card_outlined,
        ),
        16.verticalSpace,
        ImageUploadCard(
          key: ValueKey('id_card_front'),
          name: 'id_card_front',
          title: context.localizations.id_card_front_title,
          hint: context.localizations.id_card_front_hint,
          selectedFile: data.idCardFront??_idCardFrontFile,
          existingImageUrl: data.profile?.idCardFront,
          icon: Icons.credit_card,
          isRequired: widget.insuranceProfileModel == null,
          onSelectFile: (image) =>setState(() => _idCardFrontFile = image),
        ),
        12.verticalSpace,
        ImageUploadCard(
          key: ValueKey('id_card_back'),
          name: 'id_card_back',
          title: context.localizations.id_card_back_title,
          hint: context.localizations.id_card_back_hint,
          selectedFile: data.idCardBack??_idCardBackFile,
          existingImageUrl: data.profile?.idCardBack,
          icon: Icons.credit_card,
          isRequired: widget.insuranceProfileModel == null,
          onSelectFile: (image) =>setState(() => _idCardBackFile = image),
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
        SectionTitleDesign(
          title: context.localizations.insurance_card_section_title,
          icon: Icons.health_and_safety_outlined,
        ),
        16.verticalSpace,
        ImageUploadCard(
          key: ValueKey('insurance_card_front'),
          name: 'insurance_card_front',
          title: context.localizations.insurance_card_front_title,
          hint: context.localizations.insurance_card_front_hint,
          selectedFile: data.insuranceCardFront??_insuranceCardFrontFile,
          existingImageUrl: data.profile?.insuranceCardFront,
          icon: Icons.health_and_safety,
          isRequired: widget.insuranceProfileModel == null,
          onSelectFile: (image) =>setState(() => _insuranceCardFrontFile = image),
        ),
        12.verticalSpace,
        ImageUploadCard(
          key: ValueKey('insurance_card_back'),
          name: 'insurance_card_back',
          title: context.localizations.insurance_card_back_title,
          hint: context.localizations.insurance_card_back_hint,
          selectedFile: data.insuranceCardBack??_insuranceCardBackFile,
          existingImageUrl: data.profile?.insuranceCardBack,
          icon: Icons.health_and_safety,
          onSelectFile: (image) =>setState(() => _insuranceCardBackFile = image),
          isRequired: widget.insuranceProfileModel == null,
        ),
      ],
    );
  }
}
