import 'package:animate_do/animate_do.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/extensions/color_extensions.dart';
import '../../../../../widgets/image_picker/app_image.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class OrderProductList extends StatelessWidget {
  final List<Items> items;

  const OrderProductList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final item = items[index];
          return FadeInUp(
            duration: Duration(milliseconds: 400 + (index * 50)),
            delay: Duration(milliseconds: 450 + (index * 50)),
            from: 30,
            child: Container(
              margin: EdgeInsetsGeometry.only(top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: context.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: AppImage.network(
                        remoteImage: item.product?.featureImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.verticalSpace,
                        AppText(
                          text: item.product?.title ?? "",
                          textSize: 11,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: context.colorScheme.primary.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AppText(
                                    text: 'x${item.quantity ?? 1}',
                                    textSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: context.colorScheme.primary,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            AppText(
                              text: item.totalPrice?.toStringAsFixed(0) ?? '0',
                              textSize: 14,
                              fontWeight: FontWeight.w800,
                              color: context.colorScheme.primary,
                            ),
                            4.horizontalSpace,
                            AppText(
                              text: context.localizations.egp,
                              textSize: 11,
                              fontWeight: FontWeight.w500,
                              color: context.colorScheme.primary.withValues(
                                alpha: 0.7,
                              ),
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
        }, childCount: items.length),
      ),
    );
  }
}
