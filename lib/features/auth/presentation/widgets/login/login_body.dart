import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
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
        Container(
          width: double.infinity,
          color: context.colorScheme.primary,
          height: SizeConfig.bodyHeight * .5,
        ),
        LoginForm(),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: AppImage.asset(
                  fit: BoxFit.cover,
                  Assets.images.logo.path,
                  height: SizeConfig.bodyHeight * .25,
                ),
              ),],
          ),
        ),
      ],
    );
  }
}
