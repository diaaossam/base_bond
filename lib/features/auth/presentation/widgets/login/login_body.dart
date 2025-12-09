import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_size.dart';
import 'login_form.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage.asset(
          Assets.images.background.path,
          width: double.infinity,
          fit: BoxFit.cover,
          height: SizeConfig.bodyHeight * .5,
        ),

        LoginForm(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight*.1,),
              AppText(text: context.localizations.loginTitle,fontWeight: FontWeight.w700,color: Colors.white,textSize: 20,),
              SizedBox(height: SizeConfig.bodyHeight*.02,),
              AppText(text: context.localizations.loginBody,color: Colors.white,textSize: 13,fontWeight: FontWeight.w600,)
            ],
          ),
        ),
      ],
    );
  }
}
