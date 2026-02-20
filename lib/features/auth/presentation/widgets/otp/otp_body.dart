import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import 'otp_form.dart';

class OtpBodyWidget extends StatelessWidget {
  final String email;
  final String? phone;

  const OtpBodyWidget({super.key, required this.email, this.phone});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: context.colorScheme.primary,
          height: SizeConfig.bodyHeight * .5,
        ),
        OtpFormWidget(email: email, phone: phone),
        Positioned(
          left: 0,
          right: 0,
          top: SizeConfig.bodyHeight * 0.05,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: AppImage.asset(
              Assets.images.logo.path,
              height: SizeConfig.bodyHeight * .22,
            ),
          ),
        ),
      ],
    );
  }
}
