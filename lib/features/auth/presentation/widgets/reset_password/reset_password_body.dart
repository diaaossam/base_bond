import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import 'reset_password_form.dart';

class ResetPasswordBodyWidget extends StatelessWidget {
  final String email;

  const ResetPasswordBodyWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: context.colorScheme.primary,
          height: SizeConfig.bodyHeight * .5,
        ),
        ResetPasswordForm(email: email),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.bodyHeight * .1),
              AppText(
                text: context.localizations.resetPassword,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                textSize: 20,
              ),
              SizedBox(height: SizeConfig.bodyHeight * .02),
              AppText(
                text: context.localizations.resetPasswordBody,
                color: Colors.white,
                textSize: 13,
                fontWeight: FontWeight.w600,
                align: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


