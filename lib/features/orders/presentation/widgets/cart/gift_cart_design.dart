import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_constant.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/loading/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftCartDesign extends StatelessWidget {
  const GiftCartDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<CartCubit, BaseState<CartStateData>>(
        builder: (context, state) {
          return state.isLoading && state.identifier == 'points'
              ? const LoadingWidget()
              : GestureDetector(
                  onTap: () async {
                    if (ApiConfig.isGuest == true) {
                      SettingsHelper().showGuestDialog(context, isFromCart: true);
                      return;
                    }
                    if (ApiConfig.address == null) {
                      AppConstant.showCustomSnakeBar(context, context.localizations.locationValidation, false);
                      return;
                    }
                    context.read<CartCubit>().getOrderPoints(
                      price: context.read<CartCubit>().amount,
                    );
                  },
                  child: Container(
                    margin: screenPadding(),
                    decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.screenWidth * .02,
                        vertical: SizeConfig.bodyHeight * .02),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppImage.asset(Assets.icons.heart),
                            SizedBox(
                              width: SizeConfig.screenWidth * .02,
                            ),
                            Builder(
                              builder: (context) {
                                final point =
                                    (context.read<CartCubit>().amount.toInt() *
                                            0.001)
                                        .toInt();

                                return AppText(
                                  text:
                                      "${context.localizations.youWillWin} $point ${context.localizations.youWillWin2}",
                                  fontWeight: FontWeight.w500,
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: context.localizations.clickToReplacePoints,
                              color: context.colorScheme.shadow,
                            ),
                            SizedBox(width: 10.w),
                            AppImage.asset(Assets.icons.arrowDown)
                          ],
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
