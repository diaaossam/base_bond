// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i6;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i9;
import 'package:bond/features/auth/presentation/pages/register_screen.dart'
    as _i10;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i5;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i7;
import 'package:bond/features/orders/presentation/pages/cart_screen.dart'
    as _i2;
import 'package:bond/features/product/data/models/request/product_params.dart'
    as _i15;
import 'package:bond/features/product/presentation/pages/all_products_screen.dart'
    as _i1;
import 'package:bond/features/product/presentation/pages/categories_screen.dart'
    as _i3;
import 'package:bond/features/product/presentation/pages/favourite_products.dart'
    as _i4;
import 'package:bond/features/settings/presentation/pages/settings_screen.dart'
    as _i11;
import 'package:bond/features/start/presentation/pages/on_boarding_screen.dart'
    as _i8;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i12;
import 'package:flutter/material.dart' as _i14;

/// generated route for
/// [_i1.AllProductsScreen]
class AllProductsRoute extends _i13.PageRouteInfo<AllProductsRouteArgs> {
  AllProductsRoute({
    _i14.Key? key,
    required String title,
    required _i15.ProductParams initialParams,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         AllProductsRoute.name,
         args: AllProductsRouteArgs(
           key: key,
           title: title,
           initialParams: initialParams,
         ),
         initialChildren: children,
       );

  static const String name = 'AllProductsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllProductsRouteArgs>();
      return _i1.AllProductsScreen(
        key: args.key,
        title: args.title,
        initialParams: args.initialParams,
      );
    },
  );
}

class AllProductsRouteArgs {
  const AllProductsRouteArgs({
    this.key,
    required this.title,
    required this.initialParams,
  });

  final _i14.Key? key;

  final String title;

  final _i15.ProductParams initialParams;

  @override
  String toString() {
    return 'AllProductsRouteArgs{key: $key, title: $title, initialParams: $initialParams}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllProductsRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        initialParams == other.initialParams;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ initialParams.hashCode;
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i13.PageRouteInfo<void> {
  const CartRoute({List<_i13.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.CartScreen();
    },
  );
}

/// generated route for
/// [_i3.CategoriesScreen]
class CategoriesRoute extends _i13.PageRouteInfo<void> {
  const CategoriesRoute({List<_i13.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i4.FavouriteProductsScreen]
class FavouriteProductsRoute extends _i13.PageRouteInfo<void> {
  const FavouriteProductsRoute({List<_i13.PageRouteInfo>? children})
    : super(FavouriteProductsRoute.name, initialChildren: children);

  static const String name = 'FavouriteProductsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavouriteProductsScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.MainLayoutScreen]
class MainLayoutRoute extends _i13.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i13.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i8.OnBoardingScreen]
class OnBoardingRoute extends _i13.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i13.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i9.OtpScreen]
class OtpRoute extends _i13.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i14.Key? key,
    required String phone,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i9.OtpScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.phone});

  final _i14.Key? key;

  final String phone;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, phone: $phone}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key && phone == other.phone;
  }

  @override
  int get hashCode => key.hashCode ^ phone.hashCode;
}

/// generated route for
/// [_i10.RegisterScreen]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i11.SettingsScreen]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}
