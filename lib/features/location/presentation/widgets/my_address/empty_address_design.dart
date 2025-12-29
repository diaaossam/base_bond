import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class EmptyAddressDesign extends StatelessWidget {
  const EmptyAddressDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .08),
          // Animated Icon Container
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              padding: EdgeInsets.all(32.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.1),
                    context.colorScheme.primary.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.1),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: AppImage.asset(
                Assets.images.noLocation.path,
                height: SizeConfig.bodyHeight * .15,
              ),
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
          // Animated Text
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: child,
                ),
              );
            },
            child: Column(
              children: [
                AppText.title(
                  text: context.localizations.noLocation,
                  textSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                12.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: AppText.hint(
                    text: context.localizations.addAddressDeleivery,
                    textSize: 13,
                    align: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeConfig.bodyHeight * .04),
        ],
      ),
    );
  }
}
