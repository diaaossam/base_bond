import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartLocationDesign extends StatefulWidget {
  const CartLocationDesign({super.key});

  @override
  State<CartLocationDesign> createState() => _CartLocationDesignState();
}

class _CartLocationDesignState extends State<CartLocationDesign> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .02,
          vertical: SizeConfig.bodyHeight * .02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: context.localizations.address,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            if (ApiConfig.isGuest == null)
              Padding(
                padding: screenPadding(),
                child: CustomButton(
                  radius: 14,
                  height: 45.h,
                  backgroundColor: context.colorScheme.onPrimaryFixed,
                  text: context.localizations.addAddressDeleivery,
                  press: () async {
                    if (ApiConfig.isGuest == true) {
                      SettingsHelper().showGuestDialog(
                        context,
                        isFromCart: true,
                      );
                      return;
                    }

                    context.router.push(PickLocationRoute());
                  },
                ),
              )
            else
              GestureDetector(
                onTap: () async {
                  context.router.push(PickLocationRoute());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .03,
                    vertical: SizeConfig.bodyHeight * .02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colorScheme.surface,
                          border: Border.all(
                            color: context.colorScheme.outline,
                          ),
                        ),
                        child: AppImage.asset(
                          Assets.icons.mapsLocation01,
                          color: context.colorScheme.primary,
                          height: SizeConfig.bodyHeight * .02,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: ApiConfig.address?.address ?? "",
                              fontWeight: FontWeight.w500,
                              textSize: 12,
                            ),
                            SizedBox(height: 7.h),
                            AppText(
                              text: ApiConfig.address?.additionalNotes ?? "",
                              textSize: 11,
                              maxLines: 2,
                              color: context.colorScheme.shadow,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * .04,
                          vertical: SizeConfig.bodyHeight * .01,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.colorScheme.primary,
                          ),
                          color: context.colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: AppText(
                          text: context.localizations.edit,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
