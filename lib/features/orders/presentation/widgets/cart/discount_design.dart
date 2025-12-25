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
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/main_widget/custom_text_form_field.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscountDesign extends StatefulWidget {
  const DiscountDesign({super.key});

  @override
  State<DiscountDesign> createState() => _DiscountDesignState();
}

class _DiscountDesignState extends State<DiscountDesign> {

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth * .02,
            vertical: SizeConfig.bodyHeight * .02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: context.localizations.doYouHaveDiscount,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: SizeConfig.bodyHeight * .02,
            ),
            BlocConsumer<CartCubit, BaseState<CartStateData>>(
              listener: (context, state) {
                if (state.isFailure && state.identifier == 'coupon') {
                  AppConstant.showCustomSnakeBar(context, state.error?.toString() ?? '', false);
                } else if (state.isSuccess && state.identifier == 'coupon') {
                  AppConstant.showCustomSnakeBar(
                      context, context.localizations.discountApplied, true);
                }
              },
              builder: (context, state) {
                return CustomTextFormField(
                  controller: context.read<CartCubit>().discount,
                  hintText: context.localizations.doYouHaveDiscountHint,
                  prefixIcon: AppImage.asset(Assets.icons.edit2),
                  filled: true,
                  readOnly: context.read<CartCubit>().couponDiscount != 0,
                  fillColor: context.colorScheme.background,
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        end: 10, top: 4, bottom: 4),
                    child: context.read<CartCubit>().couponDiscount == 0
                        ? CustomButton(
                            textSize: 12,
                            radius: 10,
                            text: context.localizations.apply,
                            press: () {
                              if (ApiConfig.isGuest == true) {
                                SettingsHelper().showGuestDialog(context,isFromCart: true);
                                return;
                              }
                              if (context.read<CartCubit>().discount.text.isNotEmpty) {
                                context
                                    .read<CartCubit>()
                                    .applyCoupon(code: context.read<CartCubit>().discount.text);
                              }
                            },
                            width: SizeConfig.screenWidth * .22,
                          )
                        : InkWell(
                            onTap: () => context.read<CartCubit>().deleteCoupon(),
                            child: AppText(
                              text: context.localizations.cancel,
                              color: context.colorScheme.error,
                            )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
