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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
        ),
        GlassContainer(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * .03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.bodyHeight * .02),
                Center(
                  child: AppText(
                    text: title,
                    fontWeight: FontWeight.w600,
                    textSize: 20,
                    maxLines: 2,
                    align: TextAlign.center,
                    textHeight: 1.8,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: SizeConfig.bodyHeight * .04),
                Padding(
                  padding: screenPadding(),
                  child: AppText(
                    text: text,
                    fontWeight: FontWeight.w600,
                    textSize: 13,
                    maxLines: 6,
                    textHeight: 1.8,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .04),
                  padding: screenPadding(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SmoothPageIndicator(
                        controller: pageController,
                        count: count,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.white,
                          activeDotColor: context.colorScheme.primary,

                          dotHeight: 8,
                          dotWidth: 10,
                          strokeWidth: 20,
                          expansionFactor: 4,
                          spacing: 5.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: press,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                          child: Row(
                            children: [
                              AppText(
                                text: context.localizations.startNow,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                textSize: 16,
                              ),
                              10.horizontalSpace,
                              AppImage.asset(Assets.icons.arrow3),
                              10.horizontalSpace,
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: AppImage.asset(
                                  Assets.icons.arrowForward,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
