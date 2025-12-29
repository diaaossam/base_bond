// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:bond/features/auth/presentation/pages/login_screen.dart' as _i9;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i15;
import 'package:bond/features/auth/presentation/pages/register_screen.dart'
    as _i19;
import 'package:bond/features/location/data/models/response/my_address.dart'
    as _i24;
import 'package:bond/features/location/presentation/pages/add_address_screen.dart'
    as _i1;
import 'package:bond/features/location/presentation/pages/locations_screen.dart'
    as _i8;
import 'package:bond/features/location/presentation/pages/pick_location_page.dart'
    as _i16;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i7;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i10;
import 'package:bond/features/notifications/presentation/pages/notifications_screen.dart'
    as _i11;
import 'package:bond/features/orders/data/models/response/orders.dart' as _i26;
import 'package:bond/features/orders/presentation/pages/cart_screen.dart'
    as _i4;
import 'package:bond/features/orders/presentation/pages/order_details_page.dart'
    as _i13;
import 'package:bond/features/orders/presentation/pages/orders_screen.dart'
    as _i14;
import 'package:bond/features/product/data/models/request/product_params.dart'
    as _i25;
import 'package:bond/features/product/data/models/response/product_model.dart'
    as _i27;
import 'package:bond/features/product/presentation/pages/all_active_substances_page.dart'
    as _i2;
import 'package:bond/features/product/presentation/pages/all_products_screen.dart'
    as _i3;
import 'package:bond/features/product/presentation/pages/categories_screen.dart'
    as _i5;
import 'package:bond/features/product/presentation/pages/favourite_products.dart'
    as _i6;
import 'package:bond/features/product/presentation/pages/product_details_screen.dart'
    as _i18;
import 'package:bond/features/settings/presentation/pages/privacy_screen.dart'
    as _i17;
import 'package:bond/features/settings/presentation/pages/settings_screen.dart'
    as _i20;
import 'package:bond/features/start/presentation/pages/on_boarding_screen.dart'
    as _i12;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i21;
import 'package:flutter/material.dart' as _i23;

/// generated route for
/// [_i1.AddAddressScreen]
class AddAddressRoute extends _i22.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i23.Key? key,
    _i24.MyAddress? address,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         AddAddressRoute.name,
         args: AddAddressRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddAddressRoute';

  static _i22.PageInfo page = _i22.PageInfo(
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

  final _i23.Key? key;

  final _i24.MyAddress? address;

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
/// [_i2.AllActiveSubstancesPage]
class AllActiveSubstancesRoute extends _i22.PageRouteInfo<void> {
  const AllActiveSubstancesRoute({List<_i22.PageRouteInfo>? children})
    : super(AllActiveSubstancesRoute.name, initialChildren: children);

  static const String name = 'AllActiveSubstancesRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i2.AllActiveSubstancesPage();
    },
  );
}

/// generated route for
/// [_i3.AllProductsScreen]
class AllProductsRoute extends _i22.PageRouteInfo<AllProductsRouteArgs> {
  AllProductsRoute({
    _i23.Key? key,
    required String title,
    required _i25.ProductParams initialParams,
    List<_i22.PageRouteInfo>? children,
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

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllProductsRouteArgs>();
      return _i3.AllProductsScreen(
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

  final _i23.Key? key;

  final String title;

  final _i25.ProductParams initialParams;

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
/// [_i4.CartScreen]
class CartRoute extends _i22.PageRouteInfo<void> {
  const CartRoute({List<_i22.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartScreen();
    },
  );
}

/// generated route for
/// [_i5.CategoriesScreen]
class CategoriesRoute extends _i22.PageRouteInfo<void> {
  const CategoriesRoute({List<_i22.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i5.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i6.FavouriteProductsScreen]
class FavouriteProductsRoute extends _i22.PageRouteInfo<void> {
  const FavouriteProductsRoute({List<_i22.PageRouteInfo>? children})
    : super(FavouriteProductsRoute.name, initialChildren: children);

  static const String name = 'FavouriteProductsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i6.FavouriteProductsScreen();
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute({List<_i22.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.LocationsScreen]
class LocationsRoute extends _i22.PageRouteInfo<void> {
  const LocationsRoute({List<_i22.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i8.LocationsScreen();
    },
  );
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute({List<_i22.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginScreen();
    },
  );
}

/// generated route for
/// [_i10.MainLayoutScreen]
class MainLayoutRoute extends _i22.PageRouteInfo<MainLayoutRouteArgs> {
  MainLayoutRoute({
    _i23.Key? key,
    int? initialIndex,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         MainLayoutRoute.name,
         args: MainLayoutRouteArgs(key: key, initialIndex: initialIndex),
         initialChildren: children,
       );

  static const String name = 'MainLayoutRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainLayoutRouteArgs>(
        orElse: () => const MainLayoutRouteArgs(),
      );
      return _i10.MainLayoutScreen(
        key: args.key,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class MainLayoutRouteArgs {
  const MainLayoutRouteArgs({this.key, this.initialIndex});

  final _i23.Key? key;

  final int? initialIndex;

  @override
  String toString() {
    return 'MainLayoutRouteArgs{key: $key, initialIndex: $initialIndex}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MainLayoutRouteArgs) return false;
    return key == other.key && initialIndex == other.initialIndex;
  }

  @override
  int get hashCode => key.hashCode ^ initialIndex.hashCode;
}

/// generated route for
/// [_i11.NotificationsScreen]
class NotificationsRoute extends _i22.PageRouteInfo<void> {
  const NotificationsRoute({List<_i22.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i11.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i12.OnBoardingScreen]
class OnBoardingRoute extends _i22.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i22.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i12.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i13.OrderDetailsPage]
class OrderDetailsRoute extends _i22.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i23.Key? key,
    required _i26.Orders order,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, order: order),
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return _i13.OrderDetailsPage(key: args.key, order: args.order);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.order});

  final _i23.Key? key;

  final _i26.Orders order;

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
/// [_i14.OrdersScreen]
class OrdersRoute extends _i22.PageRouteInfo<void> {
  const OrdersRoute({List<_i22.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i14.OrdersScreen();
    },
  );
}

/// generated route for
/// [_i15.OtpScreen]
class OtpRoute extends _i22.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i23.Key? key,
    required String phone,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, phone: phone),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i15.OtpScreen(key: args.key, phone: args.phone);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.phone});

  final _i23.Key? key;

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
/// [_i16.PickLocationScreen]
class PickLocationRoute extends _i22.PageRouteInfo<void> {
  const PickLocationRoute({List<_i22.PageRouteInfo>? children})
    : super(PickLocationRoute.name, initialChildren: children);

  static const String name = 'PickLocationRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i16.PickLocationScreen();
    },
  );
}

/// generated route for
/// [_i17.PrivacyScreen]
class PrivacyRoute extends _i22.PageRouteInfo<PrivacyRouteArgs> {
  PrivacyRoute({
    _i23.Key? key,
    required String title,
    required num id,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         PrivacyRoute.name,
         args: PrivacyRouteArgs(key: key, title: title, id: id),
         initialChildren: children,
       );

  static const String name = 'PrivacyRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrivacyRouteArgs>();
      return _i17.PrivacyScreen(key: args.key, title: args.title, id: args.id);
    },
  );
}

class PrivacyRouteArgs {
  const PrivacyRouteArgs({this.key, required this.title, required this.id});

  final _i23.Key? key;

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
/// [_i18.ProductDetailsScreen]
class ProductDetailsRoute extends _i22.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i23.Key? key,
    required _i27.ProductModel product,
    List<_i22.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i18.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i23.Key? key;

  final _i27.ProductModel product;

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
/// [_i19.RegisterScreen]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute({List<_i22.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i19.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i20.SettingsScreen]
class SettingsRoute extends _i22.PageRouteInfo<void> {
  const SettingsRoute({List<_i22.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i20.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i21.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute({List<_i22.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i22.PageInfo page = _i22.PageInfo(
    name,
    builder: (data) {
      return const _i21.SplashScreen();
    },
  );
}
