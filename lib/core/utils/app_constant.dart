import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/theme/color_scheme.dart';
import '../extensions/color_extensions.dart';

class AppConstant {
  static Future<void> showCustomSnakeBar(
    BuildContext context,
    msg,
    isSuccess,
  ) async {
    if (msg != "" && msg != null) {
      Flushbar(
        message: msg,
        messageSize: 13,
        duration: Duration(seconds: 2),
        icon: isSuccess
            ? const Icon(Icons.check, size: 28.0, color: Colors.green)
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red),
                ),
                child: const Icon(Icons.close, size: 28.0, color: Colors.red),
              ),
        margin: const EdgeInsets.all(8),
        flushbarStyle: FlushbarStyle.GROUNDED,
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        leftBarIndicatorColor: context.colorScheme.primary,
      ).show(context);
    }
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColorScheme.light.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void showSnackBar(BuildContext context, String errorMsg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(errorMsg), backgroundColor: Colors.black),
    );
  }
}
