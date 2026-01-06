import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/data/models/request/forgot_password_params.dart';
import 'package:bond/features/auth/presentation/cubit/forgot_password/forgot_password_cubit.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../gen/assets.gen.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;

  const ResetPasswordForm({super.key, required this.email});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final isPasswordVisible = ValueNotifier(false);
  final isConfirmPasswordVisible = ValueNotifier(false);
  String? otpCode;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText.title(text: context.localizations.enterOtpCode),
              SizedBox(height: SizeConfig.bodyHeight * .01),
              AppText.hint(
                text: widget.email,
                textSize: 12,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .03),

              // OTP Input
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  autoFocus: true,
                  cursorColor: context.colorScheme.primary,
                  keyboardType: TextInputType.number,
                  length: 6,
                  textStyle: const TextStyle(color: Colors.black),
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8.r),
                    fieldHeight: 55,
                    fieldWidth: 45,
                    borderWidth: 1,
                    inactiveColor: context.colorScheme.outline,
                    activeFillColor: const Color(0xFFE4EAE8),
                    activeColor: context.colorScheme.tertiary,
                    inactiveFillColor: context.colorScheme.inversePrimary,
                    selectedColor: context.colorScheme.tertiary,
                    selectedFillColor: const Color(0xFFE4EAE8),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onCompleted: (value) => setState(() => otpCode = value),
                  enableActiveFill: true,
                  onChanged: (String value) {
                    if (value.length < 6) {
                      setState(() => otpCode = null);
                    }
                  },
                ),
              ),

              SizedBox(height: SizeConfig.bodyHeight * .03),
              
              // Divider with text
              Row(
                children: [
                  Expanded(child: Divider(color: context.colorScheme.outline)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: AppText.hint(
                      text: context.localizations.newPassword,
                      textSize: 11,
                    ),
                  ),
                  Expanded(child: Divider(color: context.colorScheme.outline)),
                ],
              ),

              SizedBox(height: SizeConfig.bodyHeight * .03),

              // New Password
              ValueListenableBuilder(
                valueListenable: isPasswordVisible,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: !value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: context.localizations.password,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: AppImage.asset(
                          Assets.icons.password,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => isPasswordVisible.value = !value,
                        child: Icon(
                          value ? Icons.remove_red_eye : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.outline),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.outline),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.primary),
                      ),
                      filled: true,
                      fillColor: context.colorScheme.surfaceContainer,
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: context.localizations.validation,
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: context.localizations.passwordLengthValidation,
                      ),
                    ]),
                  );
                },
              ),

              SizedBox(height: SizeConfig.bodyHeight * .02),

              // Confirm Password
              ValueListenableBuilder(
                valueListenable: isConfirmPasswordVisible,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: !value,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: context.localizations.passwordConfirmation,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: AppImage.asset(
                          Assets.icons.password,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () => isConfirmPasswordVisible.value = !value,
                        child: Icon(
                          value ? Icons.remove_red_eye : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.outline),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.outline),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(color: context.colorScheme.primary),
                      ),
                      filled: true,
                      fillColor: context.colorScheme.surfaceContainer,
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: context.localizations.validation,
                    ),
                  );
                },
              ),

              SizedBox(height: SizeConfig.bodyHeight * .05),

              BlocConsumer<ResetPasswordCubit, BaseState>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    context.router.pushAndPopUntil(
                      MainLayoutRoute(),
                      predicate: (route) => false,
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: context.localizations.resetPassword,
                    isLoading: state.isLoading,
                    press: () {
                      if (otpCode == null || otpCode!.length < 6) {
                        AppConstant.showCustomSnakeBar(
                          context,
                          context.localizations.enterOtpCode,
                          false,
                        );
                        return;
                      }

                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      final password = _passwordController.text;
                      final confirmPassword = _confirmPasswordController.text;

                      if (password != confirmPassword) {
                        AppConstant.showCustomSnakeBar(
                          context,
                          context.localizations.passwordValidation,
                          false,
                        );
                        return;
                      }

                      context.read<ResetPasswordCubit>().resetPassword(
                        params: ResetPasswordParams(
                          email: widget.email,
                          otpCode: otpCode!,
                          password: password,
                          passwordConfirmation: confirmPassword,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

