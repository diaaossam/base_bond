import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:bond/features/auth/presentation/widgets/login/phone_text_form_field.dart';
import 'package:bond/features/auth/presentation/widgets/login/social_button_design.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/validitor_extention.dart';
import '../../../../../gen/assets.gen.dart';
import 'dont_have_account.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

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
                child: AppImage.asset(
                  fit: BoxFit.cover,
                  Assets.images.logo.path,
                  height: SizeConfig.bodyHeight * .12,
                ),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .06),
              MobileNumberField(),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              BlocConsumer<LoginCubit, BaseState>(
                listener: (context, state) {
                  if(state.isSuccess){
                    context.router.push(OtpRoute(phone: _formKey.fieldValue("phone")));
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    text: context.localizations.login,
                    isLoading: state.isLoading,
                    press: () {
                      if (!_formKey.currentState!.saveAndValidate()) {
                        return;
                      }
                      context.read<LoginCubit>().sendOtp(phone: _formKey.fieldValue("phone"));
                    },
                  );
                },
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              CustomButton.text(
                text: context.localizations.loginAsGuest,
                press: () =>
                    context.router.pushAndPopUntil(
                      MainLayoutRoute(), predicate: (route) => false,),
              ),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              DontHaveAccountWidget(),
              SizedBox(height: SizeConfig.bodyHeight * .04),
              SocialButtonDesign(),
            ],
          ),
        ),
      ),
    );
  }
}
