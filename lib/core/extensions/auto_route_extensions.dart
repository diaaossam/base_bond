import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

extension CustomNavigationExt on BuildContext {
  Future<T?> pushRoute<T extends Object?>(PageRouteInfo route) {
    return router.push<T>(route);
  }

  Future<T?> navigateToWithCallback<T extends Object?>(PageRouteInfo route) {
    return router.push<T>(route);
  }

  void pushAndFinish<T extends PageRouteInfo>(T route) {
    router.pushAndPopUntil(route, predicate: (route) => false);
  }
}
