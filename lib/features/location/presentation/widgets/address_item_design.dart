import 'package:aslol/core/extensions/app_localizations_extension.dart';
import 'package:aslol/core/extensions/color_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:aslol/features/location/presentation/cubit/my_address/my_address_cubit.dart';
import 'package:aslol/features/location/presentation/pages/add_address_screen.dart';
import 'package:aslol/features/settings/settings_helper.dart';
import 'package:aslol/gen/assets.gen.dart';
import 'package:aslol/widgets/app_text.dart';
import 'package:aslol/widgets/custom_button.dart';
import 'package:aslol/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/router/app_router.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/response/my_address.dart';

class AddressItemDesign extends StatelessWidget {
  final MyAddress address;
  final bool isSelected;
  final bool showActions;
  final VoidCallback callback;

  const AddressItemDesign(
      {super.key,
      required this.address,
      required this.isSelected,
      required this.showActions,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * .03,
          vertical: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
          border: isSelected
              ? Border.all(color: context.colorScheme.primary)
              : null,
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colorScheme.surface,
                border: Border.all(color: context.colorScheme.outline),
              ),
              child: AppImage.asset(
                Assets.icons.location2,
                color: context.colorScheme.primary,
                height: SizeConfig.bodyHeight * .02,
              )),
          10.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: address.name ?? "",
                  fontWeight: FontWeight.w500,
                  textSize: 12,
                ),
                7.verticalSpace,
                AppText(
                  text: address.notes ?? "",
                  textSize: 11,
                  maxLines: 2,
                  color: context.colorScheme.shadow,
                ),
                if (!isSelected) ...{
                  7.verticalSpace,
                  CustomButton(
                      radius: 14,
                      height: 30.h,
                      width: SizeConfig.screenWidth * .28,
                      textSize: 7,
                      backgroundColor: Colors.transparent,
                      text: context.localizations.setAsDefault,
                      press: callback)
                }
              ],
            ),
          ),
          10.horizontalSpace,
          if (showActions) ...{
            Column(
              children: [
                InkWell(
                    onTap: () => context.router.push(
                      AddAddressRoute(
                        address: address,
                      ),
                    ).then((p0) { 
                      context.read<MyAddressCubit>().getMyAddress();
                    }),
                    child: AppImage.asset(
                      Assets.icons.edit2,
                      color: context.colorScheme.primary,
                    )),
                8.verticalSpace,
                InkWell(
                    onTap: () => SettingsHelper().showAppDialog(
                        context: context,
                        height: SizeConfig.bodyHeight * .34,
                        isAccept: (p0) {
                          if (p0) {
                            context
                                .read<MyAddressCubit>()
                                .deleteAddress(id: address.id ?? 1);
                          }
                        },
                        image: Assets.icons.trash,
                        title: context.localizations.doYouWantToDeleteAddress),
                    child: AppImage.asset(Assets.icons.trash)),
              ],
            ),
          } else if (isSelected)
            AppImage.asset(
              Assets.icons.tickCircle,
              height: SizeConfig.bodyHeight * .03,
            ),
        ],
      ),
    );
  }
}
