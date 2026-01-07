import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/validitor_extention.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../../gen/assets.gen.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});

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
              Center(
                child: Container(
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_reset_rounded,
                    size: 64.sp,
                    color: context.colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              AppText.body(
                text: context.localizations.enterEmailToReset,
                align: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              CustomTextFormField(
                name: "email",
                hintText: context.localizations.email,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: AppImage.asset(Assets.icons.email),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: context.localizations.validation,
                  ),
                  FormBuilderValidators.email(
                    errorText: context.localizations.emailValidation,
                  ),
                ]),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .06),
              BlocConsumer<ForgotPasswordCubit, BaseState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    context.router.push(
                      ResetPasswordRoute(email: _formKey.fieldValue("email")),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: context.localizations.sendCode,
                    isLoading: state.isLoading,
                    press: () {
                      if (!_formKey.currentState!.saveAndValidate()) {
                        return;
                      }
                      context.read<ForgotPasswordCubit>().forgotPassword(
                        email: _formKey.fieldValue("email"),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),
              TextButton(
                onPressed: () => context.router.maybePop(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_rounded,
                      size: 18.sp,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: 8.w),
                    AppText(
                      text: context.localizations.backToLogin,
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





