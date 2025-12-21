import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../product/presentation/widgets/category/home_categories_section.dart';
import 'banner/banners_design.dart';
import '../../../../product/data/models/request/product_params.dart';
import '../../../../product/presentation/widgets/product/product_section.dart';

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
          SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          // Best Sellers Section
          ProductSection(
            title: context.localizations.bestSellers,
            actionText: context.localizations.seeAll,
            initialParams: const ProductParams(isBestSeller: true),
          ),
          // New Arrivals Section
          ProductSection(
            title: context.localizations.newArrivals,
            actionText: context.localizations.seeAll,
            initialParams: const ProductParams(isNewArrival: true),
          ),
          // Recommended Products Section
          ProductSection(
            title: context.localizations.recommendedProducts,
            actionText: context.localizations.seeAll,
            initialParams: const ProductParams(isFeatured: true),
          ),
        ],
      ),
    );
  }
}
