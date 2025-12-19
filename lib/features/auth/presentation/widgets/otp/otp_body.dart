import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_size.dart';
import 'otp_form.dart';

class OtpBodyWidget extends StatelessWidget {
  final String phone;

  const OtpBodyWidget({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage.asset(
          Assets.images.background.path,
          width: double.infinity,
          fit: BoxFit.cover,
          height: SizeConfig.bodyHeight * 0.4,
        ),
        OtpFormWidget(),
        Positioned(
          left: 0,
          right: 0,
          top: SizeConfig.bodyHeight * 0.05,
          child: AppImage.asset(
            Assets.images.logo.path,
            height: SizeConfig.bodyHeight * .22,
          ),
        ),
      ],
    );
  }
}
