// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i7;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i10;
import 'package:bond/features/auth/presentation/pages/register_screen.dart'
    as _i13;
import 'package:bond/features/location/presentation/pages/add_address_screen.dart'
    as _i1;
import 'package:bond/features/location/presentation/pages/pick_location_page.dart'
    as _i11;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i6;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i8;
import 'package:bond/features/orders/presentation/pages/cart_screen.dart'
    as _i3;
import 'package:bond/features/product/data/models/request/product_params.dart'
    as _i18;
import 'package:bond/features/product/data/models/response/product_model.dart'
    as _i19;
import 'package:bond/features/product/presentation/pages/all_products_screen.dart'
    as _i2;
import 'package:bond/features/product/presentation/pages/categories_screen.dart'
    as _i4;
import 'package:bond/features/product/presentation/pages/favourite_products.dart'
    as _i5;
import 'package:bond/features/product/presentation/pages/product_details_screen.dart'
    as _i12;
import 'package:bond/features/settings/presentation/pages/settings_screen.dart'
    as _i14;
import 'package:bond/features/start/presentation/pages/on_boarding_screen.dart'
    as _i9;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i15;
import 'package:flutter/material.dart' as _i17;

/// generated route for
/// [_i1.AddAddressScreen]
class AddAddressRoute extends _i16.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i17.Key? key,
    InvalidType address,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         AddAddressRoute.name,
         args: AddAddressRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddAddressRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddAddressRouteArgs>(
        orElse: () => const AddAddressRouteArgs(),
      );
      return _i1.AddAddressScreen(key: args.key, address: args.address);
    },
  );
}

class AddAddressRouteArgs {
  const AddAddressRouteArgs({this.key, this.address});

  final _i17.Key? key;

  final InvalidType address;

  @override
  String toString() {
    return 'AddAddressRouteArgs{key: $key, address: $address}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddAddressRouteArgs) return false;
    return key == other.key && address == other.address;
  }

  @override
  int get hashCode => key.hashCode ^ address.hashCode;
}

/// generated route for
/// [_i2.AllProductsScreen]
class AllProductsRoute extends _i16.PageRouteInfo<AllProductsRouteArgs> {
  AllProductsRoute({
    _i17.Key? key,
    required String title,
    required _i18.ProductParams initialParams,
    List<_i16.PageRouteInfo>? children,
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

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllProductsRouteArgs>();
      return _i2.AllProductsScreen(
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

  final _i17.Key? key;

  final String title;

  final _i18.ProductParams initialParams;

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
/// [_i3.CartScreen]
class CartRoute extends _i16.PageRouteInfo<void> {
  const CartRoute({List<_i16.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.CartScreen();
    },
  );
}

/// generated route for
/// [_i4.CategoriesScreen]
class CategoriesRoute extends _i16.PageRouteInfo<void> {
  const CategoriesRoute({List<_i16.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i5.FavouriteProductsScreen]
class FavouriteProductsRoute extends _i16.PageRouteInfo<void> {
  const FavouriteProductsRoute({List<_i16.PageRouteInfo>? children})
    : super(FavouriteProductsRoute.name, initialChildren: children);

  static const String name = 'FavouriteProductsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavouriteProductsScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginScreen();
    },
  );
}

/// generated route for
/// [_i8.MainLayoutScreen]
class MainLayoutRoute extends _i16.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i16.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i9.OnBoardingScreen]
class OnBoardingRoute extends _i16.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i16.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i10.OtpScreen]
class OtpRoute extends _i16.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i17.Key? key,
    required String phone,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i10.OtpScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.phone});

  final _i17.Key? key;

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
/// [_i11.PickLocationScreen]
class PickLocationRoute extends _i16.PageRouteInfo<void> {
  const PickLocationRoute({List<_i16.PageRouteInfo>? children})
    : super(PickLocationRoute.name, initialChildren: children);

  static const String name = 'PickLocationRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.PickLocationScreen();
    },
  );
}

/// generated route for
/// [_i12.ProductDetailsScreen]
class ProductDetailsRoute extends _i16.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i17.Key? key,
    required _i19.ProductModel product,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i12.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i17.Key? key;

  final _i19.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, product: $product}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && product == other.product;
  }

  @override
  int get hashCode => key.hashCode ^ product.hashCode;
}

/// generated route for
/// [_i13.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i14.SettingsScreen]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i15.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.SplashScreen();
    },
  );
}
