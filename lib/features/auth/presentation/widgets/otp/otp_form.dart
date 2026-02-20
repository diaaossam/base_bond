import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/data/models/request/otp_params.dart';
import 'package:bond/features/auth/presentation/cubit/otp/otp_cubit.dart';
import 'package:bond/features/auth/presentation/widgets/login/phone_text_form_field.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_constant.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'otp_counter.dart';

class OtpFormWidget extends StatefulWidget {
  final String email;
  final String? phone;

  const OtpFormWidget({super.key, required this.email, this.phone});

  @override
  State<OtpFormWidget> createState() => _OtpFormWidgetState();
}

class _OtpFormWidgetState extends State<OtpFormWidget> {
  String? otpCode;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<OtpTimerDesignState> _timerKey = GlobalKey<OtpTimerDesignState>();

  String get _currentPhone {
    final value = _formKey.currentState?.fields['phone']?.value;
    if (value != null && value.toString().replaceAll(RegExp(r'[^0-9]'), '').length >= 11) {
      return value.toString().replaceAll(RegExp(r'[^0-9]'), '');
    }
    return widget.phone ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final hasPhone = widget.phone != null && widget.phone!.isNotEmpty;

    return Container(
      margin: EdgeInsets.only(top: SizeConfig.bodyHeight * .3),
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .04,
        horizontal: SizeConfig.screenWidth * .04,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText.title(text: context.localizations.otpTitle),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText.body(
                text: hasPhone
                    ? '${context.localizations.otpSentTo('+20${widget.phone}')} Edit below to resend to a new number.'
                    : context.localizations.otpBody,
              ),
              if (hasPhone) ...[
                SizedBox(height: SizeConfig.bodyHeight * .02),
                MobileNumberField(
                  name: 'phone',
                  data: widget.phone,
                  isRequired: true,
                ),
              ],
              SizedBox(height: SizeConfig.bodyHeight * .05),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  autoFocus: !hasPhone,
                  cursorColor: context.colorScheme.primary,
                  keyboardType: TextInputType.number,
                  length: 6,
                  textStyle: const TextStyle(color: Colors.black),
                  obscureText: false,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8.r),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    borderWidth: 1,
                    inactiveColor: context.colorScheme.surface,
                    activeFillColor: const Color(0xFFE4EAE8),
                    activeColor: context.colorScheme.tertiary,
                    inactiveFillColor: context.colorScheme.inversePrimary,
                    selectedColor: context.colorScheme.tertiary,
                    selectedFillColor: const Color(0xFFE4EAE8),
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onCompleted: (value) => setState(() => otpCode = value),
                  enableActiveFill: true,
                  onChanged: (String value) {},
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              OtpTimerDesign(
                key: _timerKey,
                onFinish: () => setState(() {}),
                onResendTap: () => _onResend(context),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .1),
              BlocConsumer<OtpCubit, BaseState<void>>(
                listener: (context, state) {
                  if (state.isSuccess) {
                    if (state.identifier == 'resendOtp') {
                      _timerKey.currentState?.resetTimer();
                      AppConstant.showCustomSnakeBar(
                        context,
                        'OTP sent successfully',
                        true,
                      );
                    } else {
                      context.router.pushAndPopUntil(
                        MainLayoutRoute(),
                        predicate: (route) => false,
                      );
                    }
                  }
                },
                buildWhen: (previous, current) =>
                    previous != current ||
                    (current.isSuccess && current.identifier == 'resendOtp'),
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state.isLoading && state.identifier != 'resendOtp',
                    text: context.localizations.confirm,
                    press: () {
                      final phone = hasPhone ? _currentPhone : null;
                      context.read<OtpCubit>().verifyOtp(
                        params: OtpParams(
                          email: widget.email,
                          phone: phone?.isNotEmpty == true ? phone : null,
                          otpCode: otpCode,
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

  Future<void> _onResend(BuildContext context) async {
    if (!_formKey.currentState!.saveAndValidate()) return;
    final phone = _currentPhone;
    if (phone.isEmpty) {
      AppConstant.showCustomSnakeBar(
        context,
        context.localizations.validation,
        false,
      );
      return;
    }
    context.read<OtpCubit>().resendOtp(phone: phone);
  }
}
