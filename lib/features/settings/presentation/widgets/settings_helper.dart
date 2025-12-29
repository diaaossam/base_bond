import 'package:auto_route/auto_route.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';

class SettingsHelper {
  void showGuestDialog(BuildContext context, {bool isFromCart = false}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.localizations.login),
        content: Text(context.localizations.loginAsGuest),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (isFromCart) {
                context.router.pushAndPopUntil(LoginRoute(),predicate: (route) => false,);
              } else {
                context.router.push(LoginRoute());
              }
            },
            child: Text(context.localizations.login),
          ),
        ],
      ),
    );
  }
}











