import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/data/models/request/otp_params.dart';
import 'package:bond/features/auth/presentation/cubit/otp/otp_cubit.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'otp_counter.dart';

class OtpFormWidget extends StatefulWidget {
  final String email;

  const OtpFormWidget({super.key, required this.email});

  @override
  State<OtpFormWidget> createState() => _OtpFormWidgetState();
}

class _OtpFormWidgetState extends State<OtpFormWidget> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText.title(text: context.localizations.otpTitle),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText.body(text: context.localizations.otpBody),
            SizedBox(height: SizeConfig.bodyHeight * .05),
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
            OtpTimerDesign(onFinish: () {}),
            SizedBox(height: SizeConfig.bodyHeight * .1),
            BlocConsumer<OtpCubit, BaseState<void>>(
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
                  isLoading: state.isLoading,
                  text: context.localizations.confirm,
                  press: () {
                    context.read<OtpCubit>().verifyOtp(
                      params: OtpParams(email: widget.email, otpCode: otpCode),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
