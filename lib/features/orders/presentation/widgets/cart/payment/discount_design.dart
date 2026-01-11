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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

class DiscountDesign extends StatefulWidget {
  const DiscountDesign({super.key});

  @override
  State<DiscountDesign> createState() => _DiscountDesignState();
}

class _DiscountDesignState extends State<DiscountDesign>
    with SingleTickerProviderStateMixin {
  late AnimationController _successController;
  late Animation<double> _successAnimation;

  @override
  void initState() {
    super.initState();
    _successController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _successAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _successController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _successController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              blurRadius: 2,
              offset: Offset(0, 2 + 1),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.secondary.withValues(alpha: 0.15),
                        colorScheme.secondary.withValues(alpha: 0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.local_offer_rounded,
                    color: colorScheme.secondary,
                    size: 18,
                  ),
                ),
                12.horizontalSpace,
                AppText(
                  text: context.localizations.doYouHaveDiscount,
                  fontWeight: FontWeight.w600,
                  textSize: 11,
                ),
              ],
            ),
            SizedBox(height: 5.h),
            BlocBuilder<CartCubit, BaseState<CartStateData>>(
              builder: (context, state) {
                final bloc = context.read<CartCubit>();
                final hasDiscount = bloc.couponDiscount != 0;

                return Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: hasDiscount
                            ? Border.all(
                                color: colorScheme.tertiary.withValues(
                                  alpha: 0.5,
                                ),
                                width: 2,
                              )
                            : null,
                      ),
                      child: CustomTextFormField(
                        controller: bloc.discount,
                        hintText: context.localizations.doYouHaveDiscountHint,
                        prefixIcon: AppImage.asset(Assets.icons.edit2),
                        filled: true,
                        readOnly: hasDiscount,
                        fillColor: hasDiscount
                            ? colorScheme.tertiary.withValues(alpha: 0.05)
                            : colorScheme.background,
                        suffixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: 10,
                            top: 4,
                            bottom: 4,
                          ),
                          child: _buildSuffixButton(
                            context,
                            state,
                            hasDiscount,
                            bloc,
                          ),
                        ),
                      ),
                    ),
                    if (hasDiscount)
                      AnimatedBuilder(
                        animation: _successAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _successAnimation.value,
                            child: Container(
                              margin: EdgeInsets.only(top: 12.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colorScheme.tertiary.withValues(
                                      alpha: 0.15,
                                    ),
                                    colorScheme.tertiary.withValues(
                                      alpha: 0.05,
                                    ),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: colorScheme.tertiary.withValues(
                                    alpha: 0.3,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_rounded,
                                    color: colorScheme.tertiary,
                                    size: 20,
                                  ),
                                  10.horizontalSpace,
                                  Expanded(
                                    child: AppText(
                                      text:
                                          context.localizations.discountApplied,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.tertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuffixButton(
    BuildContext context,
    BaseState<CartStateData> state,
    bool hasDiscount,
    CartCubit bloc,
  ) {
    final colorScheme = context.colorScheme;

    if (hasDiscount) {
      return GestureDetector(
        onTap: () => bloc.deleteCoupon(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: colorScheme.error.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.close_rounded, size: 16, color: colorScheme.error),
              6.horizontalSpace,
              AppText(
                text: context.localizations.cancel,
                color: colorScheme.error,
                fontWeight: FontWeight.w600,
                textSize: 12,
              ),
            ],
          ),
        ),
      );
    }
    return CustomButton(
      textSize: 12,
      radius: 10,
      text: context.localizations.apply,
      isLoading: state.isLoading && state.identifier == 'coupon',
      press: () {
        if (ApiConfig.isGuest == true) {
          SettingsHelper().showGuestDialog(context,);
          return;
        }
        if (bloc.discount.text.isNotEmpty) {
          bloc.applyCoupon(
            code: bloc.discount.text,
            amount: state.data!.amount,
          );
        }
      },
      width: SizeConfig.screenWidth * .22,
    );
  }
}
