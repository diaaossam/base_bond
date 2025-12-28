import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../core/utils/app_strings.dart';

class TabBarDesign extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final Function(int)? onTap;
  final List<Tab> tabs;

  const TabBarDesign({
    super.key,
    required this.tabController,
    this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredTabBar(
      color: const Color(0xffF5F5F5),
      tabBar: TabBar(
        dividerColor: Colors.transparent,
        onTap: onTap,
        labelPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .08,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: context.colorScheme.onBackground,
        labelColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: AppStrings.arabicFont,
          fontWeight: FontWeight.w500,
        ),
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicator: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        controller: tabController,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, SizeConfig.bodyHeight * .075);
}

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  const ColoredTabBar({super.key, required this.color, required this.tabBar})
    : super(color: color, child: tabBar);

  @override
  final Color color;
  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;
}
