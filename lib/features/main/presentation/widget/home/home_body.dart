import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'banner/banners_design.dart';
import 'category/home_categories_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        CustomSliverAppBar(
          actions: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                shape: BoxShape.circle,
              ),
              child: AppImage.asset(
                Assets.icons.searchNormal,
                color: context.colorScheme.shadow,
              ),
            ),
            10.horizontalSpace,
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.surfaceContainer,
              ),
              child: AppImage.asset(
                Assets.icons.notification,
                color: context.colorScheme.shadow,
              ),
            ),
            10.horizontalSpace,
          ],
        ),
      ],
      body: CustomScrollView(
        slivers: [
          HomeBannersImage(),
          const HomeCategoriesSection(),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
        ],
      ),
    );
  }
}
