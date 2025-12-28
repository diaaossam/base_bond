import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.horizontalSpace,
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: AppImage.network(
            height: 40,
            width: 40,
            remoteImage: UserDataService().getUserData()?.profileImage,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              AppText.hint(text: context.localizations.welcome),
              5.verticalSpace,
              AppText(text: UserDataService().getUserData()?.name ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}
