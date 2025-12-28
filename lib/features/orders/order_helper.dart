import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/core/utils/app_size.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/gen/assets.gen.dart';
import 'package:bond/widgets/image_picker/app_image.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';

class OrderHelper {
  Future<void> showSuccessOrderDialog({
    required BuildContext context,
    required Orders order,
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

}
