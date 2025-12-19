import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/app/presentation/cubit/app_cubit.dart';
import 'package:bond/features/app/presentation/cubit/app_state.dart';
import 'package:bond/features/auth/data/models/request/register_params.dart';
import 'package:bond/features/auth/presentation/widgets/login/phone_text_form_field.dart';
import 'package:bond/features/auth/presentation/widgets/register/already_have_account.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_drop_down.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/media_form_field.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

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
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return state.map(
                    (value) => Column(
                      children: [
                        AppDropDown(
                          name: "governorate",
                          hint: context.localizations.governorate,
                          validator: FormBuilderValidators.required(
                            errorText: context.localizations.validation,
                          ),
                          onChanged: (int? value) {
                            context.read<AppCubit>().getRegion(id: value!);
                            _formKey.currentState?.fields['region']?.reset();
                          },
                          items: state.governorates
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
                          hint: context.localizations.region,
                          validator: FormBuilderValidators.required(
                            errorText: context.localizations.validation,
                          ),
                          items: state.cities
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.id,
                                  child: AppText(text: e.title ?? ''),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .06),
              CustomButton(
                text: context.localizations.register,
                press: () {

                  if (!_formKey.currentState!.saveAndValidate()) {
                    return;
                  }
                  RegisterParams params = RegisterParams(
                    name: _formKey.fieldValue('username'),
                    phone: _formKey.fieldValue('phone'),
                    provinceId: _formKey.fieldValue("governorate"),
                    regionId: _formKey.fieldValue("region"),
                    imagePath: (_formKey.fieldValue("media") as File).path,
                  );

                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AlreadyHaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
