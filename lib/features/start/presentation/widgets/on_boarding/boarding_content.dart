import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import 'glass_container.dart';

class BoardingContent extends StatelessWidget {
  const BoardingContent({
    super.key,
    required this.text,
    required this.image,
    required this.title,
    required this.press,
    required this.pageController,
    required this.count,
  });

  final String text, image, title;
  final VoidCallback press;
  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding(),
      child: Column(
        children: [
          AppImage.asset(
            image,
            height: MediaQuery.of(context).size.height * .5,
            width: double.infinity,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          Center(
            child: AppText(
              text: title,
              fontWeight: FontWeight.w600,
              textSize: 20,
              maxLines: 2,
              align: TextAlign.center,
              textHeight: 1.8,
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .015),
          Padding(
            padding: screenPadding(),
            child: AppText(
              text: text,
              fontWeight: FontWeight.w600,
              textSize: 13,
              maxLines: 6,
              textHeight: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
