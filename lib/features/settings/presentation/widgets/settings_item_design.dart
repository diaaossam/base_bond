import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/rotate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItemDesign extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback press;

  const SettingsItemDesign({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            10.horizontalSpace,
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: context.colorScheme.outline,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppImage.asset(image, height: 20.h, width: 20.h),
            ),
            10.horizontalSpace,
            Expanded(
              child: AppText(text: text, fontWeight: FontWeight.w500),
            ),
            Rotate(child: AppImage.asset(Assets.icons.arrowForward)),
            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
