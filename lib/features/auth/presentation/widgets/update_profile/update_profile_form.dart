import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/app/presentation/cubit/app_cubit.dart';
import 'package:bond/features/app/presentation/cubit/app_state_data.dart';
import 'package:bond/features/auth/data/models/request/register_params.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/features/auth/presentation/cubit/update_profile/update_profile_cubit.dart';
import 'package:bond/features/location/data/models/requests/location_entity.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/image_picker/media_form_field.dart';
import 'package:bond/widgets/main_widget/app_drop_down.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final ValueNotifier<LocationEntity?> _location = ValueNotifier(null);
  final ValueNotifier<String?> _selectedImage = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    final userData = UserDataService().getUserData();
    if (userData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (userData.address?.governorate?.id != null) {
          context.read<AppCubit>().getRegion(
            id: userData.address!.governorate!.id!.toInt(),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = UserDataService().getUserData();

    return FormBuilder(
      key: _formKey,
      initialValue: {
        'username': userData?.name ?? '',
        'phone': userData?.phone?.replaceAll('+20', '') ?? '',
        'governorate': userData?.address?.governorate?.id?.toInt(),
        'region': userData?.address?.city?.id?.toInt(),
        'address': userData?.address?.address ?? '',
        'mapLocation': userData?.address?.streetAddress ?? '',
      },
      child: SingleChildScrollView(
        padding: screenPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.verticalSpace,
            MediaFormField(
              onDataReceived: (File file) {},
              height: SizeConfig.bodyHeight * .12,
              width: SizeConfig.bodyHeight * .12,
              initialImage: UserDataService().getUserData()?.profileImage,
            ),
            24.verticalSpace,
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: context.localizations.personalInfo,
                    fontWeight: FontWeight.bold,
                    textSize: 12,
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    name: "username",
                    hintText: context.localizations.fullName,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: AppImage.asset(
                        Assets.icons.user,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  ),
                  16.verticalSpace,
                  CustomTextFormField(
                    name: "phone",
                    hintText: context.localizations.phoneNumber,
                    keyboardType: TextInputType.phone,
                    readOnly: true,
                    // Phone cannot be changed
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: AppImage.asset(
                        Assets.icons.phone,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            24.verticalSpace,

            // Address Section
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: BlocBuilder<AppCubit, BaseState<AppStateData>>(
                builder: (context, state) {
                  final data = state.data ?? const AppStateData();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: context.localizations.address,
                        fontWeight: FontWeight.bold,
                        textSize: 12,
                      ),
                      20.verticalSpace,
                      AppDropDown(
                        name: "governorate",
                        hint: context.localizations.governorate,
                        isLoading:
                            state.isLoading &&
                            state.identifier == "governorate",
                        validator: FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                        onChanged: (int? value) {
                          if (value != null) {
                            context.read<AppCubit>().getRegion(id: value);
                            _formKey.currentState?.fields['region']?.reset();
                          }
                        },
                        items: data.governorates
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.id,
                                child: AppText(text: e.title ?? ''),
                              ),
                            )
                            .toList(),
                      ),
                      16.verticalSpace,
                      AppDropDown(
                        name: "region",
                        isLoading:
                            state.isLoading && state.identifier == "cities",
                        hint: context.localizations.region,
                        validator: FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                        items: data.cities
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.id,
                                child: AppText(text: e.title ?? ''),
                              ),
                            )
                            .toList(),
                      ),
                      16.verticalSpace,
                      CustomTextFormField(
                        name: "address",
                        hintText: context.localizations.address,
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: AppImage.asset(
                            Assets.icons.mapsLocation01,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        validator: FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                      ),
                      16.verticalSpace,
                      ValueListenableBuilder(
                        valueListenable: _location,
                        builder: (context, value, child) => CustomTextFormField(
                          name: "mapLocation",
                          hintText: context.localizations.locationOnMap,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: AppImage.asset(
                              Assets.icons.pinLocation02,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(12.r),
                            child: AppImage.asset(
                              Assets.icons.arrowForward,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                          validator: FormBuilderValidators.required(
                            errorText: context.localizations.validation,
                          ),
                          onTap: () async {
                            final result = await context.router.push(
                              PickLocationRoute(),
                            );
                            if (result != null) {
                              final data = result as LocationEntity;
                              _location.value = data;
                              _formKey.currentState?.patchValue({
                                "mapLocation": data.address,
                              });
                            }
                          },
                          readOnly: true,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            32.verticalSpace,

            // Save Button
            BlocConsumer<UpdateProfileCubit, BaseState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Fluttertoast.showToast(
                    msg: context.localizations.profileUpdated,
                    backgroundColor: Colors.green,
                  );
                  context.router.pop();
                }
                if (state.isFailure) {
                  Fluttertoast.showToast(
                    msg:
                        state.error?.toString() ??
                        context.localizations.thereIsError,
                    backgroundColor: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: context.localizations.saveChanges,
                  isLoading: state.isLoading,
                  press: () {
                    if (!_formKey.currentState!.saveAndValidate()) {
                      return;
                    }
                    final fields = _formKey.currentState!.fields;

                    final params = RegisterParams(
                      name: fields['username']?.value as String?,
                      phone: fields['phone']?.value as String?,
                      address: fields['address']?.value as String?,
                      latitude:
                          _location.value?.lat.toString() ??
                          userData?.address?.latitude.toString(),
                      longitude:
                          _location.value?.lon.toString() ??
                          userData?.address?.longitude.toString(),
                      governorateId: fields['governorate']?.value as int?,
                      cityId: fields['region']?.value as int?,
                      image: fields['media']?.value != null
                          ? (fields['media']?.value as File).path
                          : null,
                    );

                    context.read<UpdateProfileCubit>().updateProfile(
                      params: params,
                    );
                  },
                );
              },
            ),

            32.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _location.dispose();
    _selectedImage.dispose();
    super.dispose();
  }
}
