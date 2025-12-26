import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/features/settings/presentation/widgets/settings_item_design.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';

import '../../../../core/extensions/color_extensions.dart';

class SettingsListDesign extends StatelessWidget {
  const SettingsListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          SettingsItemDesign(
            text: context.localizations.myOrders,
            press: () {},
            image: Assets.images.orders.path,
          ),
          SettingsItemDesign(
            text: context.localizations.myPoints,
            press: () {},
            image: Assets.images.coins01.path,
          ),
          SettingsItemDesign(
            text: context.localizations.address,
            press: () =>context.router.push(LocationsRoute()),
            image: Assets.images.map.path,
          ),
          SettingsItemDesign(
            text: context.localizations.privacyPolicy,
            press: () =>context.router.push(PrivacyRoute(title: context.localizations.privacyPolicy, id: 3)),
            image: Assets.images.shieldKey.path,
          ),
          SettingsItemDesign(
            text: context.localizations.termsAndCon,
            press: () =>context.router.push(PrivacyRoute(title: context.localizations.termsAndCon, id: 2)),
            image: Assets.images.alertSquare.path,
          ),
          SettingsItemDesign(
            text: context.localizations.customerSupport,
            press: () {},
            image: Assets.images.chatting01.path,
          ),
          SettingsItemDesign(
            text: context.localizations.mode,
            press: () {},
            image: Assets.images.mode.path,
          ),
          SettingsItemDesign(
            text: context.localizations.language,
            press: () {},
            image: Assets.images.languageCircle.path,
          ),
          SettingsItemDesign(
            text: context.localizations.logOut,
            press: () {},
            image: Assets.images.logout.path,
          ),
        ],
      ),
    );
  }
}
