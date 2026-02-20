import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(16),
      child: AppImage.asset(Assets.images.logo.path,size: SizeConfig.bodyHeight,),
    );
  }
}
