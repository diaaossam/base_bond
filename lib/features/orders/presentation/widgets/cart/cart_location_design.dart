import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../location/data/models/response/my_address.dart';

class CartLocationDesign extends StatefulWidget {
  final MyAddress? defaultAddress;
  final Function(MyAddress)? onAddressChanged;

  const CartLocationDesign({
    super.key,
    this.defaultAddress,
    this.onAddressChanged,
  });

  @override
  State<CartLocationDesign> createState() => _CartLocationDesignState();
}

class _CartLocationDesignState extends State<CartLocationDesign> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
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
                        context.colorScheme.primary.withValues(alpha: 0.15),
                        context.colorScheme.primary.withValues(alpha: 0.08),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.location_on_rounded,
                    color: context.colorScheme.primary,
                    size: 22,
                  ),
                ),
                12.horizontalSpace,
                AppText(
                  text: context.localizations.address,
                  fontWeight: FontWeight.w700,
                  textSize: 12,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            if (ApiConfig.isGuest == null)
              CustomButton(
                radius: 14,
                height: 48.h,
                text: context.localizations.addAddressDeleivery,
                press: () async {
                  if (ApiConfig.isGuest == true) {
                    SettingsHelper().showGuestDialog(context, isFromCart: true);
                    return;
                  }
                  context.router.push(PickLocationRoute());
                },
              )
            else if (widget.defaultAddress == null)
              SizedBox.shrink()
            else
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: EdgeInsets.all(14.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colorScheme.background,
                      context.colorScheme.surface,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: context.colorScheme.outline.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.shadow.withValues(alpha: 0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppImage.asset(
                      Assets.icons.mapsLocation01,
                      color: context.colorScheme.primary,
                      height: 20,
                    ),
                    14.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: widget.defaultAddress?.address ?? "",
                            fontWeight: FontWeight.w600,
                            textSize: 12,
                            maxLines: 2,
                          ),
                          SizedBox(height: 6.h),
                          AppText(
                            text:
                                "${widget.defaultAddress?.governorate?.title} - ${widget.defaultAddress?.city?.title}",
                            textSize: 11,
                            maxLines: 2,
                            color: context.colorScheme.shadow,
                          ),
                          if (widget
                                  .defaultAddress
                                  ?.additionalNotes
                                  ?.isNotEmpty ==
                              true) ...[
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.notes_rounded,
                                  size: 12,
                                  color: context.colorScheme.shadow,
                                ),
                                6.horizontalSpace,
                                Expanded(
                                  child: AppText(
                                    text:
                                        widget
                                            .defaultAddress
                                            ?.additionalNotes ??
                                        "",
                                    textSize: 11,
                                    maxLines: 2,
                                    color: context.colorScheme.shadow,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                    12.horizontalSpace,
                    InkWell(
                      onTap: () async {
                        await context.router.push(LocationsRoute()).then((
                          value,
                        ) {
                          if (widget.onAddressChanged != null) {
                            widget.onAddressChanged!(
                              CommonCaching.defaultAddress??widget.defaultAddress!,
                            );
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context.colorScheme.primary.withValues(
                                alpha: 0.15,
                              ),
                              context.colorScheme.primary.withValues(
                                alpha: 0.08,
                              ),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: context.colorScheme.primary.withValues(
                              alpha: 0.3,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              size: 16,
                              color: context.colorScheme.primary,
                            ),
                            6.horizontalSpace,
                            AppText(
                              text: context.localizations.edit,
                              textSize: 12,
                              fontWeight: FontWeight.w600,
                              color: context.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
