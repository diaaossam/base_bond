import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/presentation/widgets/login/phone_text_form_field.dart';
import 'package:bond/features/auth/presentation/widgets/login/social_button_design.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  height: SizeConfig.bodyHeight * .2,
                ),
              ),
              MobileNumberField(),
              SizedBox(height: SizeConfig.bodyHeight*.04,),
              CustomButton(text: context.localizations.loginTitle, press: (){}),
              SizedBox(height: SizeConfig.bodyHeight*.02,),
              CustomButton.text(text: context.localizations.loginAsGuest, press: (){}),
              SizedBox(height: SizeConfig.bodyHeight*.04,),
              DontHaveAccountWidget(),
              SizedBox(height: SizeConfig.bodyHeight*.04,),
              SocialButtonDesign(),
            ],
          ),
        ),
      ),
    );
  }
}
