import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartDesign extends StatelessWidget {
  const EmptyCartDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppImage.asset(
            Assets.icons.emptyCart,
            fit: BoxFit.cover,
            height: SizeConfig.bodyHeight * .2,
          ),
          SizedBox(height: SizeConfig.bodyHeight*.04,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .1,
            ),
            child: AppText(
              text: context.localizations.noCart,
              maxLines: 2,
              fontWeight: FontWeight.w600,
              textSize: 14,
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight*.02,),
          AppText.hint(text: context.localizations.emptyCartHint),
        ],
      ),
    );
  }
}
