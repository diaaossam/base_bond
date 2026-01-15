import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/settings/presentation/widgets/dialogs/language_dialog.dart';
import 'package:bond/features/settings/presentation/widgets/dialogs/logout_dialog.dart';
import 'package:bond/features/settings/presentation/widgets/dialogs/theme_mode_dialog.dart';
import 'package:bond/features/settings/presentation/widgets/settings_dialog_card.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/features/settings/presentation/widgets/settings_item_design.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SettingsListDesign extends StatelessWidget {
  const SettingsListDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsDialogCard(
          title: context.localizations.myOrders,
          children: [
            SettingsItemDesign(
              text: context.localizations.myOrders,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(
                  OrdersRoute(
                    type: AppStrings.orders,
                    title: context.localizations.myOrders,
                  ),
                );
              },
              image: Assets.images.order.path,
            ),
            SettingsItemDesign(
              text: context.localizations.prescriptionOrders,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(
                  OrdersRoute(
                    type: AppStrings.prescription,
                    title: context.localizations.prescriptionOrders,
                  ),
                );
              },
              image: Assets.images.medical.path,
            ),
            SettingsItemDesign(
              text: context.localizations.insuranceOrders,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(
                  OrdersRoute(
                    type: AppStrings.insurance,
                    title: context.localizations.insuranceOrders,
                  ),
                );
              },
              image: Assets.images.insurance.path,
            ),
          ],
        ),
        SettingsDialogCard(
          title: context.localizations.myOrders,
          children: [
            SettingsItemDesign(
              text: context.localizations.ourBranches,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(OurBranchesRoute());
              },
              image: Assets.images.map.path,
            ),
            SettingsItemDesign(
              text: context.localizations.address,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(LocationsRoute());
              },
              image: Assets.images.map.path,
            ),
            SettingsItemDesign(
              text: context.localizations.insuranceProfile,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(const InsuranceProfileRoute());
              },
              image: Assets.icons.insuranceProfile,
            ),
          ],
        ),
        SettingsDialogCard(
          title: context.localizations.myOrders,
          children: [
            SettingsItemDesign(
              text: context.localizations.privacyPolicy,
              press: () => context.router.push(
                PrivacyRoute(title: context.localizations.privacyPolicy, id: 3),
              ),
              image: Assets.images.shieldKey.path,
            ),
            SettingsItemDesign(
              text: context.localizations.termsAndCon,
              press: () => context.router.push(
                PrivacyRoute(title: context.localizations.termsAndCon, id: 2),
              ),
              image: Assets.images.alertSquare.path,
            ),
            SettingsItemDesign(
              text: context.localizations.customerSupport,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                context.router.push(const SupportChatRoute());
              },
              image: Assets.images.chatting01.path,
            ),
            SettingsItemDesign(
              text: context.localizations.mode,
              press: () => ThemeModeDialog.show(context),
              image: Assets.images.mode.path,
            ),
            SettingsItemDesign(
              text: context.localizations.language,
              press: () => LanguageDialog.show(context),
              image: Assets.images.languageCircle.path,
            ),
            SettingsItemDesign(
              text: context.localizations.logOut,
              press: () {
                if (ApiConfig.isGuest == true) {
                  SettingsHelper().showGuestDialog(context);
                  return;
                }
                LogoutDialog.show(context);
              },
              image: Assets.images.logout.path,
            ),
          ],
        ),
      ],
    );
  }
}
