// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i8;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i13;
import 'package:bond/features/auth/presentation/pages/register_screen.dart'
    as _i17;
import 'package:bond/features/location/data/models/response/my_address.dart'
    as _i22;
import 'package:bond/features/location/presentation/pages/add_address_screen.dart'
    as _i1;
import 'package:bond/features/location/presentation/pages/locations_screen.dart'
    as _i7;
import 'package:bond/features/location/presentation/pages/pick_location_page.dart'
    as _i14;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i6;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i9;
import 'package:bond/features/orders/data/models/response/orders.dart' as _i24;
import 'package:bond/features/orders/presentation/pages/cart_screen.dart'
    as _i3;
import 'package:bond/features/orders/presentation/pages/order_details_page.dart'
    as _i11;
import 'package:bond/features/orders/presentation/pages/orders_screen.dart'
    as _i12;
import 'package:bond/features/product/data/models/request/product_params.dart'
    as _i23;
import 'package:bond/features/product/data/models/response/product_model.dart'
    as _i25;
import 'package:bond/features/product/presentation/pages/all_products_screen.dart'
    as _i2;
import 'package:bond/features/product/presentation/pages/categories_screen.dart'
    as _i4;
import 'package:bond/features/product/presentation/pages/favourite_products.dart'
    as _i5;
import 'package:bond/features/product/presentation/pages/product_details_screen.dart'
    as _i16;
import 'package:bond/features/settings/presentation/pages/privacy_screen.dart'
    as _i15;
import 'package:bond/features/settings/presentation/pages/settings_screen.dart'
    as _i18;
import 'package:bond/features/start/presentation/pages/on_boarding_screen.dart'
    as _i10;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i19;
import 'package:flutter/material.dart' as _i21;

/// generated route for
/// [_i1.AddAddressScreen]
class AddAddressRoute extends _i20.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i21.Key? key,
    _i22.MyAddress? address,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         AddAddressRoute.name,
         args: AddAddressRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddAddressRoute';

  static _i20.PageInfo page = _i20.PageInfo(
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

  final _i21.Key? key;

  final _i22.MyAddress? address;

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
class AllProductsRoute extends _i20.PageRouteInfo<AllProductsRouteArgs> {
  AllProductsRoute({
    _i21.Key? key,
    required String title,
    required _i23.ProductParams initialParams,
    List<_i20.PageRouteInfo>? children,
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

  static _i20.PageInfo page = _i20.PageInfo(
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

  final _i21.Key? key;

  final String title;

  final _i23.ProductParams initialParams;

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
class CartRoute extends _i20.PageRouteInfo<void> {
  const CartRoute({List<_i20.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i3.CartScreen();
    },
  );
}

/// generated route for
/// [_i4.CategoriesScreen]
class CategoriesRoute extends _i20.PageRouteInfo<void> {
  const CategoriesRoute({List<_i20.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i4.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i5.FavouriteProductsScreen]
class FavouriteProductsRoute extends _i20.PageRouteInfo<void> {
  const FavouriteProductsRoute({List<_i20.PageRouteInfo>? children})
    : super(FavouriteProductsRoute.name, initialChildren: children);

  static const String name = 'FavouriteProductsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i5.FavouriteProductsScreen();
    },
  );
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute({List<_i20.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreen();
    },
  );
}

/// generated route for
/// [_i7.LocationsScreen]
class LocationsRoute extends _i20.PageRouteInfo<void> {
  const LocationsRoute({List<_i20.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i7.LocationsScreen();
    },
  );
}

/// generated route for
/// [_i8.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute({List<_i20.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i8.LoginScreen();
    },
  );
}

/// generated route for
/// [_i9.MainLayoutScreen]
class MainLayoutRoute extends _i20.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i20.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i9.MainLayoutScreen();
    },
  );
}

/// generated route for
/// [_i10.OnBoardingScreen]
class OnBoardingRoute extends _i20.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i20.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i10.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i11.OrderDetailsPage]
class OrderDetailsRoute extends _i20.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i21.Key? key,
    required _i24.Orders order,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, order: order),
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return _i11.OrderDetailsPage(key: args.key, order: args.order);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.order});

  final _i21.Key? key;

  final _i24.Orders order;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, order: $order}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrderDetailsRouteArgs) return false;
    return key == other.key && order == other.order;
  }

  @override
  int get hashCode => key.hashCode ^ order.hashCode;
}

/// generated route for
/// [_i12.OrdersScreen]
class OrdersRoute extends _i20.PageRouteInfo<void> {
  const OrdersRoute({List<_i20.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i12.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i13.OtpScreen]
class OtpRoute extends _i20.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i21.Key? key,
    required String phone,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i13.OtpScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.phone});

  final _i21.Key? key;

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
/// [_i14.PickLocationScreen]
class PickLocationRoute extends _i20.PageRouteInfo<void> {
  const PickLocationRoute({List<_i20.PageRouteInfo>? children})
    : super(PickLocationRoute.name, initialChildren: children);

  static const String name = 'PickLocationRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i14.PickLocationScreen();
    },
  );
}

/// generated route for
/// [_i15.PrivacyScreen]
class PrivacyRoute extends _i20.PageRouteInfo<PrivacyRouteArgs> {
  PrivacyRoute({
    _i21.Key? key,
    required String title,
    required num id,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         PrivacyRoute.name,
         args: PrivacyRouteArgs(key: key, title: title, id: id),
         initialChildren: children,
       );

  static const String name = 'PrivacyRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrivacyRouteArgs>();
      return _i15.PrivacyScreen(key: args.key, title: args.title, id: args.id);
    },
  );
}

class PrivacyRouteArgs {
  const PrivacyRouteArgs({this.key, required this.title, required this.id});

  final _i21.Key? key;

  final String title;

  final num id;

  @override
  String toString() {
    return 'PrivacyRouteArgs{key: $key, title: $title, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PrivacyRouteArgs) return false;
    return key == other.key && title == other.title && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ title.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i16.ProductDetailsScreen]
class ProductDetailsRoute extends _i20.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i21.Key? key,
    required _i25.ProductModel product,
    List<_i20.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i16.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i21.Key? key;

  final _i25.ProductModel product;

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
/// [_i17.RegisterScreen]
class RegisterRoute extends _i20.PageRouteInfo<void> {
  const RegisterRoute({List<_i20.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i17.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i18.SettingsScreen]
class SettingsRoute extends _i20.PageRouteInfo<void> {
  const SettingsRoute({List<_i20.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i18.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i19.SplashScreen]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute({List<_i20.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i20.PageInfo page = _i20.PageInfo(
    name,
    builder: (data) {
      return const _i19.SplashScreen();
    },
  );
}
