import 'package:flutter/material.dart';

import '../core/extensions/app_localizations_extension.dart';
import '../core/extensions/color_extensions.dart';
import '../core/utils/app_size.dart';
import '../gen/assets.gen.dart';
import 'main_widget/app_text.dart';
import 'main_widget/custom_button.dart';
import 'image_picker/app_image.dart';

class AppFailureWidget extends StatelessWidget {
  final String? title;
  final String? body;
  final String? image;
  final VoidCallback? callback;
  final String? buttonText;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const AppFailureWidget({
    super.key,
    this.title,
    this.body,
    this.padding,
    this.image,
    this.callback,
    this.buttonText,
    this.height = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.bodyHeight * .04),
      child: Column(
        children: [
          SizedBox(height: height),
          SizedBox(height: SizeConfig.bodyHeight * .06),
          Padding(
            padding:
            padding ??
                EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * .06,
                ),
            child: AppImage.asset(image ?? Assets.images.logo.path),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          AppText(
            text: title ?? context.localizations.thereIsError,
            textSize: 13,
            align: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
          AppText(
            text: body ?? "",
            textSize: 12,
            maxLines: 40,
            align: TextAlign.center,
          ),
          const Spacer(),
          CustomButton(
            text: buttonText ?? context.localizations.back,
            press: callback ?? () => Navigator.pop(context),
            backgroundColor: Colors.transparent,
            textColor: context.colorScheme.primary,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
        ],
      ),
    );
  }
}
