import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';

class OrderHelper {
  Future<void> showSuccessOrderDialog({
    required BuildContext context,
    required num id,
  }) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.bodyHeight * .65,
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
                Center(
                  child: AppImage.asset(
                    fit: BoxFit.cover,
                    height: SizeConfig.bodyHeight * .3,
                    Assets.images.alertSquare.path,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.bodyHeight * .04,
                ),
                AppText(
                  text: context.localizations.orderPlacedSuccess,
                  textSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
                AppText(text: context.localizations.orderPlacedSuccess2),
                SizedBox(
                  height: SizeConfig.bodyHeight * .08,
                ),
                CustomButton(
                    text: context.localizations.trackOrder,
                    press: () {
                      Navigator.pop(context);
                      // TODO: Navigate to track order screen when available
                    }),
              ],
            ),
          ),
        ),
      ),
    ).whenComplete(
      () => context.router.pushAndPopUntil(MainLayoutRoute(), predicate: (route) => false),
    );
  }

  // TODO: Add ColorsModel when available
  // String getProductVariety({
  //   required List<ColorsModel> colors,
  // }) {
  //   String result = "";
  //   for (var element in colors) {
  //     result = "$result${element.color} - ";
  //   }
  //   return result;
  // }

  String formatDateTime(DateTime dateTime) {
    final time =
        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    final date =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
    return "$time . $date";
  }

  String formatDate(DateTime dateTime) {
    final date =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
    return date;
  }

  // TODO: Add GiftsModelBottomSheet when available
  // Future<void> showGiftOptions(
  //     {required BuildContext context,
  //     required PointsModel points,
  //     required String orderPoints,
  //     required Function(AvailablePoints) callBack}) async {
  //   showCupertinoModalBottomSheet(
  //       context: context,
  //       builder: (context) => GiftsModelBottomSheet(
  //             callBack: callBack,
  //             orderPoints: orderPoints,
  //             pointsModel: points,
  //           ));
  // }

  Future<void> showConfirmOrderDialog({
    required BuildContext context,
    required Function(bool) onReceive,
  }) async {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.bodyHeight * .54,
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
                Center(
                  child: AppImage.asset(
                    fit: BoxFit.cover,
                    height: SizeConfig.bodyHeight * .12,
                    Assets.icons.shoppingCart,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.bodyHeight * .04,
                ),
                AppText(
                  text: context.localizations.confirmOrderTitle,
                  textSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
                AppText(
                  text: context.localizations.confirmOrder,
                  maxLines: 2,
                  align: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.bodyHeight * .08,
                ),
                CustomButton(
                    text: context.localizations.confirmOrderTitle,
                    press: () {
                      onReceive(true);
                      Navigator.pop(context);
                    }),
                SizedBox(
                  height: SizeConfig.bodyHeight * .02,
                ),
                CustomButton(
                  text: context.localizations.cancel,
                  press: () {
                    onReceive(false);
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  textColor: context.colorScheme.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
