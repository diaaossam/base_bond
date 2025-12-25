import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_cubit.dart';
import 'package:bond/features/orders/presentation/cubit/cart/cart_state_data.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PriceCartDesign extends StatelessWidget {
  const PriceCartDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, BaseState<CartStateData>>(
      builder: (context, state) {
        final bloc = context.read<CartCubit>();
        final formatter = NumberFormat.decimalPatternDigits();
        return SliverToBoxAdapter(
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * .02,
              vertical: SizeConfig.bodyHeight * .02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: context.localizations.invoice,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: screenPadding(),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AppText(text: context.localizations.total),
                          ),
                          AppText(
                            text:
                                "${formatter.format(bloc.amount.toInt())} ${context.localizations.iqd}",
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      if (ApiConfig.address != null) ...{
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                text: context.localizations.shippingCost,
                              ),
                            ),
                            AppText(
                              text:
                                  "${formatter.format(ApiConfig.address?.province?.deliveryPrice ?? 0)} ${context.localizations.iqd}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                      },
                      if (bloc.couponDiscount != 0) ...{
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                color: context.colorScheme.error,
                                text: context.localizations.discount,
                              ),
                            ),
                            AppText(
                              color: context.colorScheme.error,
                              text:
                                  " - ${formatter.format(bloc.couponDiscount.toInt())} ${context.localizations.iqd}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                      },
                      if (bloc.pointDiscount != 0) ...{
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                color: context.colorScheme.error,
                                text: context.localizations.discount,
                              ),
                            ),
                            AppText(
                              color: context.colorScheme.error,
                              text:
                                  " - ${formatter.format(bloc.pointDiscount.toInt())} ${context.localizations.iqd}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                      },
                      if (bloc.isFreeDeleivery &&
                          ApiConfig.address?.province?.deliveryPrice !=
                              null) ...{
                        Row(
                          children: [
                            Expanded(
                              child: AppText(
                                color: context.colorScheme.error,
                                text: context.localizations.freeDeleivery,
                              ),
                            ),
                            AppText(
                              color: context.colorScheme.error,
                              text:
                                  " -  ${formatter.format(ApiConfig.address?.province?.deliveryPrice ?? 0)} ${context.localizations.iqd}",
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                      },
                      Row(
                        children: [
                          Expanded(
                            child: AppText(
                              text: context.localizations.totalPrice,
                              fontWeight: FontWeight.w700,
                              textSize: 15,
                              color: context.colorScheme.tertiary,
                            ),
                          ),
                          AppText(
                            text: _setUpPrice(
                              amount: bloc.amount,
                              context: context,
                              isFreeDeleivery: bloc.isFreeDeleivery,
                              couponDiscount: bloc.couponDiscount,
                              pointDiscount: bloc.pointDiscount,
                              deleivery:
                                  (ApiConfig.address?.province?.deliveryPrice ??
                                  0),
                            ),
                            fontWeight: FontWeight.w700,
                            textSize: 15,
                            color: context.colorScheme.tertiary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _setUpPrice({
    required num amount,
    required num deleivery,
    required BuildContext context,
    required num couponDiscount,
    required num pointDiscount,
    required bool isFreeDeleivery,
  }) {
    final formatter = NumberFormat.decimalPatternDigits();

    final total =
        (amount +
                deleivery -
                couponDiscount -
                pointDiscount -
                (isFreeDeleivery ? deleivery : 0))
            .toStringAsFixed(2);

    return "${formatter.format(num.parse(total))} ${context.localizations.iqd}";
  }
}
