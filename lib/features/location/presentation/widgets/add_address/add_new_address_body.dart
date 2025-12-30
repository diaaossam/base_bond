import 'package:auto_route/auto_route.dart';
import 'package:bond/features/location/presentation/widgets/add_address/pick_location_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../core/bloc/helper/base_state.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_drop_down.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../../../widgets/main_widget/custom_button.dart';
import '../../../../../widgets/main_widget/custom_text_form_field.dart';
import '../../../../app/presentation/cubit/app_cubit.dart';
import '../../../../app/presentation/cubit/app_state_data.dart';
import '../../../data/models/requests/location_entity.dart';
import '../../../data/models/requests/saved_location_params.dart';
import '../../../data/models/response/my_address.dart';
import '../../cubit/add_new_address/add_new_address_cubit.dart';
import 'animted_fold_section.dart';

class AddNewAddressBody extends StatefulWidget {
  final MyAddress? address;

  const AddNewAddressBody({super.key, this.address});

  @override
  State<AddNewAddressBody> createState() => _AddNewAddressBodyState();
}

class _AddNewAddressBodyState extends State<AddNewAddressBody>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormBuilderState>();
  LocationEntity? locationEntity;
  bool _isDefault = false;

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

    _initializeFormData();
  }

  void _initializeFormData() {
    if (widget.address != null) {
      final address = widget.address!;
      if (address.latitude != null && address.longitude != null) {
        locationEntity = LocationEntity(
          lat: double.tryParse(address.latitude.toString()) ?? 0.0,
          lon: double.tryParse(address.longitude.toString()) ?? 0.0,
          address: address.address ?? "",
        );
      }
      _isDefault = address.isDefault == true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<AppCubit>().getRegion(
          id: widget.address!.governorate!.id!,
        );
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewAddressCubit, BaseState<void>>(
      listener: (context, state) {
        if (state.isSuccess) {
          context.router.maybePop(true);
        }
      },
      child: FadeTransition(
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
                PickLocationDesign(
                  onLocationPicked: (data) {
                    setState(() => locationEntity = data);
                  },
                  locationEntity: locationEntity,
                ),
                24.verticalSpace,
                _buildFormFieldsSection(context),
                24.verticalSpace,
                _buildDefaultSwitch(context),
                32.verticalSpace,
                AnimatedFormSection(
                  delay: 500,
                  child: BlocBuilder<AddNewAddressCubit, BaseState<void>>(
                    builder: (context, state) {
                      return CustomButton(
                        text: widget.address != null
                            ? context.localizations.editAddress
                            : context.localizations.saveLocation,
                        isLoading: state.isLoading,
                        press: () {
                          if (_formKey.currentState?.saveAndValidate() ??
                              false) {
                            final formData = _formKey.currentState!.value;

                            final params = SavedLocationParams(
                              provinceId: formData['governorate'] as int?,
                              regionId: formData['region'] as int?,
                              name: formData['name'] as String?,
                              address: formData['address'] as String?,
                              notes: formData['notes'] as String?,
                              lat: locationEntity?.lat,
                              lng: locationEntity?.lon,
                              isDefault: _isDefault,
                              streetAddress: locationEntity?.address,
                            );

                            context.read<AddNewAddressCubit>().addNewAddress(
                              saved: params,
                              id: widget.address?.id,
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                24.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFieldsSection(BuildContext context) {
    return BlocBuilder<AppCubit, BaseState<AppStateData>>(
      builder: (context, state) {
        final data = state.data ?? const AppStateData();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            AnimatedFormSection(
              delay: 100,
              child: Row(
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
                  AppText.title(
                    text: context.localizations.addressDetails,
                    textSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),

            20.verticalSpace,

            // Address Name
            AnimatedFormSection(
              delay: 150,
              child: _buildInputField(
                context: context,
                name: 'name',
                hint: context.localizations.addressName,
                icon: Icons.bookmark_outline_rounded,
                initialValue: widget.address?.address,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
            ),

            16.verticalSpace,

            // Governorate Dropdown
            AnimatedFormSection(
              delay: 250,
              child: _buildDropdownField(
                context: context,
                name: 'governorate',
                hint: context.localizations.governorate,
                icon: Icons.location_city_outlined,
                isLoading: state.isLoading && state.identifier == 'governorate',
                initialValue: widget.address?.governorate?.id,
                items: data.governorates
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: AppText(text: e.title ?? ''),
                      ),
                    )
                    .toList(),
                onChanged: (int? value) {
                  if (value != null) {
                    context.read<AppCubit>().getRegion(id: value);
                    _formKey.currentState?.fields['region']?.reset();
                  }
                },
              ),
            ),

            16.verticalSpace,

            // Region Dropdown
            AnimatedFormSection(
              delay: 300,
              child: _buildDropdownField(
                context: context,
                name: 'region',
                hint: context.localizations.region,
                icon: Icons.map_outlined,
                isLoading: state.isLoading && state.identifier == 'cities',
                initialValue: widget.address?.city?.id,

                items: data.cities
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.id,
                        child: AppText(text: e.title ?? ''),
                      ),
                    )
                    .toList(),
              ),
            ),

            16.verticalSpace,
            AnimatedFormSection(
              delay: 350,
              child: _buildInputField(
                context: context,
                name: 'address',
                hint: context.localizations.enterAddressDetails,
                icon: Icons.home_outlined,
                initialValue: widget.address?.address,
                maxLines: 2,
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
            ),

            16.verticalSpace,

            // Additional Notes
            AnimatedFormSection(
              delay: 400,
              child: _buildInputField(
                context: context,
                name: 'notes',
                hint: context.localizations.enterNotes,
                icon: Icons.note_outlined,
                initialValue: widget.address?.additionalNotes,
                maxLines: 3,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputField({
    required BuildContext context,
    required String name,
    required String hint,
    required IconData icon,
    String? initialValue,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
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
        name: name,
        hintText: hint,
        initialValue: initialValue,
        keyboardType: keyboardType,
        maxLines: maxLines,
        validator: validator,
        prefixIcon: Container(
          margin: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: context.colorScheme.primary, size: 20.sp),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required String name,
    required String hint,
    required IconData icon,
    required List<DropdownMenuItem<int>> items,
    required bool isLoading,
    int? initialValue,
    void Function(int?)? onChanged,
  }) {
    return Container(
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
      child: AppDropDown<int>(
        name: name,
        hint: hint,
        items: items,
        isLoading: isLoading,
        initialValue: initialValue,
        onChanged: onChanged,
        validator: FormBuilderValidators.required(
          errorText: context.localizations.validation,
        ),
        icon: Container(
          margin: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: context.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, color: context.colorScheme.primary, size: 20.sp),
        ),
      ),
    );
  }

  Widget _buildDefaultSwitch(BuildContext context) {
    return AnimatedFormSection(
      delay: 450,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _isDefault = !_isDefault),
          borderRadius: BorderRadius.circular(16.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              gradient: _isDefault
                  ? LinearGradient(
                      colors: [
                        context.colorScheme.primary.withValues(alpha: 0.1),
                        context.colorScheme.primary.withValues(alpha: 0.05),
                      ],
                    )
                  : null,
              color: _isDefault ? null : context.colorScheme.surface,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: _isDefault
                    ? context.colorScheme.primary
                    : context.colorScheme.outline.withValues(alpha: 0.3),
                width: _isDefault ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: _isDefault
                      ? context.colorScheme.primary.withValues(alpha: 0.15)
                      : Colors.black.withValues(alpha: 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    gradient: _isDefault
                        ? LinearGradient(
                            colors: [
                              context.colorScheme.primary,
                              context.colorScheme.primary.withValues(
                                alpha: 0.8,
                              ),
                            ],
                          )
                        : null,
                    color: _isDefault
                        ? null
                        : context.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Icon(
                    _isDefault
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: _isDefault
                        ? Colors.white
                        : context.colorScheme.primary,
                    size: 22.sp,
                  ),
                ),
                14.horizontalSpace,
                Expanded(
                  child: AppText(
                    text: context.localizations.makeDefault,
                    fontWeight: FontWeight.w600,
                    textSize: 12,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 50.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    gradient: _isDefault
                        ? LinearGradient(
                            colors: [
                              context.colorScheme.primary,
                              context.colorScheme.primary.withValues(
                                alpha: 0.8,
                              ),
                            ],
                          )
                        : null,
                    color: _isDefault
                        ? null
                        : context.colorScheme.outline.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    alignment: _isDefault
                        ? AlignmentDirectional.centerEnd
                        : AlignmentDirectional.centerStart,
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
