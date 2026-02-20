import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/app/presentation/cubit/app_cubit.dart';
import 'package:bond/features/auth/data/models/request/register_params.dart';
import 'package:bond/features/auth/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:bond/features/auth/presentation/widgets/login/phone_text_form_field.dart';
import 'package:bond/features/auth/presentation/widgets/register/already_have_account.dart';
import 'package:bond/features/location/data/models/requests/location_entity.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_drop_down.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/media_form_field.dart';
import '../../../../app/presentation/cubit/app_state_data.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final isPasswordVisible = ValueNotifier(false);
  final isPasswordConfirmationVisible = ValueNotifier(false);
  final ValueNotifier<LocationEntity?> _location = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.bodyHeight * .25),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .04,
        horizontal: SizeConfig.screenWidth * .04,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      height: SizeConfig.bodyHeight,
      child: FormBuilder(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediaFormField(
                onDataReceived: (File file) {},
                height: SizeConfig.bodyHeight * .12,
                width: SizeConfig.bodyHeight * .12,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomTextFormField(
                name: "username",
                hintText: context.localizations.fullName,
                prefixIcon: AppImage.asset(Assets.icons.user),
                validator: FormBuilderValidators.required(
                  errorText: context.localizations.validation,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              MobileNumberField(),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomTextFormField(
                name: "email",
                hintText: context.localizations.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: AppImage.asset(Assets.icons.email),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.email(
                  ),
                  FormBuilderValidators.required(
                    errorText: context.localizations.validation,
                  )
                ]),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ValueListenableBuilder(
                valueListenable: isPasswordVisible,
                builder: (context, value, child) {
                  return CustomTextFormField(
                    name: "password",
                    hintText: context.localizations.password,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordVisible.value,
                    prefixIcon: AppImage.asset(Assets.icons.password),
                    suffixIcon: InkWell(
                      onTap: () =>
                          isPasswordVisible.value = !isPasswordVisible.value,
                      child: Icon(
                        value ? Icons.remove_red_eye : Icons.visibility_off,
                      ),
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              ValueListenableBuilder(
                valueListenable: isPasswordConfirmationVisible,
                builder: (context, value, child) {
                  return CustomTextFormField(
                    name: "passwordConfirmation",
                    hintText: context.localizations.passwordConfirmation,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !isPasswordConfirmationVisible.value,
                    prefixIcon: AppImage.asset(Assets.icons.password),
                    suffixIcon: InkWell(
                      onTap: () => isPasswordConfirmationVisible.value =
                          !isPasswordConfirmationVisible.value,
                      child: Icon(
                        value ? Icons.remove_red_eye : Icons.visibility_off,
                      ),
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  );
                },
              ),

              SizedBox(height: SizeConfig.bodyHeight * .02),
              BlocBuilder<AppCubit, BaseState<AppStateData>>(
                builder: (context, state) {
                  final data = state.data ?? const AppStateData();
                  return Column(
                    children: [
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
                      SizedBox(height: SizeConfig.bodyHeight * .02),
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
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      CustomTextFormField(
                        name: "address",
                        hintText: context.localizations.address,
                        prefixIcon: AppImage.asset(Assets.icons.mapsLocation01),
                        validator: FormBuilderValidators.required(
                          errorText: context.localizations.validation,
                        ),
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .02),
                      ValueListenableBuilder(
                        valueListenable: _location,
                        builder: (context, value, child) => CustomTextFormField(
                          name: "mapLocation",
                          hintText: context.localizations.locationOnMap,
                          prefixIcon: AppImage.asset(
                            Assets.icons.pinLocation02,
                          ),
                          suffixIcon: AppImage.asset(Assets.icons.arrowForward),
                          validator: FormBuilderValidators.required(
                            errorText: context.localizations.validation,
                          ),
                          onTap: () async {
                            final result = await context.router.push(
                              PickLocationRoute(),
                            );
                            print(result);
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
              SizedBox(height: SizeConfig.bodyHeight * .06),
              BlocConsumer<RegisterCubit, BaseState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    context.router.push(
                      OtpRoute(
                      email: _formKey.fieldValue("email"),
                      phone: _formKey.fieldValue("phone"),
                    ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: context.localizations.register,
                    isLoading: state.isLoading,
                    press: () {
                      if (!_formKey.currentState!.saveAndValidate()) {
                        return;
                      }
                      final fields = _formKey.currentState!.fields;
                      String password = fields['password']?.value as String;
                      String passwordConfirmation =
                          fields['passwordConfirmation']?.value as String;
                      if (password != passwordConfirmation) {
                        AppConstant.showCustomSnakeBar(
                          context,
                          context.localizations.passwordValidation,
                          false,
                        );
                        return;
                      }
                      final params = RegisterParams(
                        name: fields['username']?.value as String?,
                        phone: fields['phone']?.value as String?,
                        address: fields['address']?.value as String?,
                        latitude: _location.value?.lat.toString(),
                        longitude: _location.value?.lon.toString(),
                        governorateId: fields['governorate']?.value as int?,
                        cityId: fields['region']?.value as int?,
                        image: (fields['media']?.value as File?)?.path,
                        email: fields['email']?.value as String?,
                        password: password,
                      );

                      context.read<RegisterCubit>().register(params: params);
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AlreadyHaveAccountWidget(),
              SizedBox(height: SizeConfig.bodyHeight * .04),
            ],
          ),
        ),
      ),
    );
  }
}
