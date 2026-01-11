import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/main/data/models/nav_enum.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/router/app_router.gr.dart';
import '../../../../core/extensions/app_localizations_extension.dart';

@RoutePage()
class MainLayoutScreen extends StatelessWidget {
  final int? initialIndex;

  const MainLayoutScreen({super.key, this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeRoute(),
        FavouriteProductsRoute(),
        OrdersRoute(type: "orders", title: context.localizations.myOrders),
        CartRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          onTap: (value) {
            if(value==1 ||value==2){
              SettingsHelper().showGuestDialog(context);
              return;
            }
            tabsRouter.setActiveIndex(value);
          },
          currentIndex: tabsRouter.activeIndex,
          elevation: 10,
          unselectedItemColor: context.colorScheme.shadow,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: UserNavItem.values.asMap().entries.map((entry) {
            final e = entry.value;
            return BottomNavigationBarItem(
              label: e.title,
              activeIcon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20.w,
                    height: 3.h,
                    color: context.colorScheme.primary,
                  ),
                  SizedBox(height: 4.h),
                  AppImage.asset(
                    e.activeIcon,
                    color: context.colorScheme.primary,
                  ),
                ],
              ),
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 20.w,
                    height: 1.h,
                    color: Colors.transparent,
                  ),
                  SizedBox(height: 4.h),
                  AppImage.asset(
                    e.inActiveIcon,
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
