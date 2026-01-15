import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/api_config.dart';

class InfoCardDesign extends StatelessWidget {
  const InfoCardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (ApiConfig.isGuest == true) {
          SettingsHelper().showGuestDialog(context);
          return;
        }
        context.router.push(UpdateProfileRoute());
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: context.colorScheme.primary,
                ),
              ),
              child:ApiConfig.isGuest == true
                  ? AppImage.asset(Assets.images.logo.path, height: 50, width: 50)
                  : AppImage.network(
                height: 50,
                width: 50,
                remoteImage: UserDataService().getUserData()?.profileImage,
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppText(
                    text: ApiConfig.isGuest == true
                        ? context.localizations.guest
                        : "${UserDataService().getUserData()?.name}",
                    fontWeight: FontWeight.w600,
                    textSize: 13,
                  ),
                  10.verticalSpace,
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: AppText.hint(text: ApiConfig.isGuest == true
                        ? context.localizations.guest
                        : "${UserDataService().getUserData()?.email}"),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: context.colorScheme.shadow),
              ),
              child: Row(
                children: [
                  AppImage.asset(Assets.icons.edit2),
                  10.horizontalSpace,
                  AppText(text: context.localizations.edit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
