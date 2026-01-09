// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:bond/features/auth/presentation/pages/forgot_password_screen.dart'
    as _i10;
import 'package:bond/features/auth/presentation/pages/login_screen.dart'
    as _i14;
import 'package:bond/features/auth/presentation/pages/otp_screen.dart' as _i20;
import 'package:bond/features/auth/presentation/pages/register_screen.dart'
    as _i25;
import 'package:bond/features/auth/presentation/pages/reset_password_screen.dart'
    as _i26;
import 'package:bond/features/auth/presentation/pages/update_profile_screen.dart'
    as _i30;
import 'package:bond/features/chat/data/models/response/ticket_model.dart'
    as _i36;
import 'package:bond/features/chat/presentation/pages/chat_messages_screen.dart'
    as _i7;
import 'package:bond/features/chat/presentation/pages/support_chat_screen.dart'
    as _i29;
import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart'
    as _i37;
import 'package:bond/features/insurance_profile/presentation/pages/create_insurance_profile_screen.dart'
    as _i8;
import 'package:bond/features/insurance_profile/presentation/pages/insurance_profile_screen.dart'
    as _i12;
import 'package:bond/features/location/data/models/response/my_address.dart'
    as _i33;
import 'package:bond/features/location/presentation/pages/add_address_screen.dart'
    as _i1;
import 'package:bond/features/location/presentation/pages/locations_screen.dart'
    as _i13;
import 'package:bond/features/location/presentation/pages/pick_location_page.dart'
    as _i21;
import 'package:bond/features/main/data/models/category_model.dart' as _i35;
import 'package:bond/features/main/presentation/pages/categories_details_screen.dart'
    as _i5;
import 'package:bond/features/main/presentation/pages/categories_screen.dart'
    as _i6;
import 'package:bond/features/main/presentation/pages/home_screen.dart' as _i11;
import 'package:bond/features/main/presentation/pages/main_layout.dart' as _i15;
import 'package:bond/features/notifications/presentation/pages/notifications_screen.dart'
    as _i16;
import 'package:bond/features/orders/data/models/response/orders.dart' as _i38;
import 'package:bond/features/orders/presentation/pages/cart_screen.dart'
    as _i4;
import 'package:bond/features/orders/presentation/pages/order_details_page.dart'
    as _i18;
import 'package:bond/features/orders/presentation/pages/orders_screen.dart'
    as _i19;
import 'package:bond/features/orders/presentation/pages/prescription.dart'
    as _i22;
import 'package:bond/features/product/data/models/request/product_params.dart'
    as _i34;
import 'package:bond/features/product/data/models/response/product_model.dart'
    as _i39;
import 'package:bond/features/product/presentation/pages/all_active_substances_page.dart'
    as _i2;
import 'package:bond/features/product/presentation/pages/all_products_screen.dart'
    as _i3;
import 'package:bond/features/product/presentation/pages/favourite_products.dart'
    as _i9;
import 'package:bond/features/product/presentation/pages/product_details_screen.dart'
    as _i24;
import 'package:bond/features/settings/presentation/pages/privacy_screen.dart'
    as _i23;
import 'package:bond/features/settings/presentation/pages/settings_screen.dart'
    as _i27;
import 'package:bond/features/start/presentation/pages/on_boarding_screen.dart'
    as _i17;
import 'package:bond/features/start/presentation/pages/splash_screen.dart'
    as _i28;
import 'package:flutter/material.dart' as _i32;

/// generated route for
/// [_i1.AddAddressScreen]
class AddAddressRoute extends _i31.PageRouteInfo<AddAddressRouteArgs> {
  AddAddressRoute({
    _i32.Key? key,
    _i33.MyAddress? address,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         AddAddressRoute.name,
         args: AddAddressRouteArgs(key: key, address: address),
         initialChildren: children,
       );

  static const String name = 'AddAddressRoute';

  static _i31.PageInfo page = _i31.PageInfo(
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

  final _i32.Key? key;

  final _i33.MyAddress? address;

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
class AllActiveSubstancesRoute extends _i31.PageRouteInfo<void> {
  const AllActiveSubstancesRoute({List<_i31.PageRouteInfo>? children})
    : super(AllActiveSubstancesRoute.name, initialChildren: children);

  static const String name = 'AllActiveSubstancesRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i2.AllActiveSubstancesPage();
    },
  );
}

/// generated route for
/// [_i3.AllProductsScreen]
class AllProductsRoute extends _i31.PageRouteInfo<AllProductsRouteArgs> {
  AllProductsRoute({
    _i32.Key? key,
    required String title,
    required _i34.ProductParams initialParams,
    bool fromHome = false,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         AllProductsRoute.name,
         args: AllProductsRouteArgs(
           key: key,
           title: title,
           initialParams: initialParams,
           fromHome: fromHome,
         ),
         initialChildren: children,
       );

  static const String name = 'AllProductsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AllProductsRouteArgs>();
      return _i3.AllProductsScreen(
        key: args.key,
        title: args.title,
        initialParams: args.initialParams,
        fromHome: args.fromHome,
      );
    },
  );
}

class AllProductsRouteArgs {
  const AllProductsRouteArgs({
    this.key,
    required this.title,
    required this.initialParams,
    this.fromHome = false,
  });

  final _i32.Key? key;

  final String title;

  final _i34.ProductParams initialParams;

  final bool fromHome;

  @override
  String toString() {
    return 'AllProductsRouteArgs{key: $key, title: $title, initialParams: $initialParams, fromHome: $fromHome}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AllProductsRouteArgs) return false;
    return key == other.key &&
        title == other.title &&
        initialParams == other.initialParams &&
        fromHome == other.fromHome;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      title.hashCode ^
      initialParams.hashCode ^
      fromHome.hashCode;
}

/// generated route for
/// [_i4.CartScreen]
class CartRoute extends _i31.PageRouteInfo<void> {
  const CartRoute({List<_i31.PageRouteInfo>? children})
    : super(CartRoute.name, initialChildren: children);

  static const String name = 'CartRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i4.CartScreen();
    },
  );
}

/// generated route for
/// [_i5.CategoriesDetailsScreen]
class CategoriesDetailsRoute
    extends _i31.PageRouteInfo<CategoriesDetailsRouteArgs> {
  CategoriesDetailsRoute({
    _i32.Key? key,
    required _i35.CategoryModel category,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         CategoriesDetailsRoute.name,
         args: CategoriesDetailsRouteArgs(key: key, category: category),
         initialChildren: children,
       );

  static const String name = 'CategoriesDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoriesDetailsRouteArgs>();
      return _i5.CategoriesDetailsScreen(
        key: args.key,
        category: args.category,
      );
    },
  );
}

class CategoriesDetailsRouteArgs {
  const CategoriesDetailsRouteArgs({this.key, required this.category});

  final _i32.Key? key;

  final _i35.CategoryModel category;

  @override
  String toString() {
    return 'CategoriesDetailsRouteArgs{key: $key, category: $category}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoriesDetailsRouteArgs) return false;
    return key == other.key && category == other.category;
  }

  @override
  int get hashCode => key.hashCode ^ category.hashCode;
}

/// generated route for
/// [_i6.CategoriesScreen]
class CategoriesRoute extends _i31.PageRouteInfo<void> {
  const CategoriesRoute({List<_i31.PageRouteInfo>? children})
    : super(CategoriesRoute.name, initialChildren: children);

  static const String name = 'CategoriesRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i6.CategoriesScreen();
    },
  );
}

/// generated route for
/// [_i7.ChatMessagesScreen]
class ChatMessagesRoute extends _i31.PageRouteInfo<ChatMessagesRouteArgs> {
  ChatMessagesRoute({
    _i32.Key? key,
    required _i36.TicketModel ticketModel,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         ChatMessagesRoute.name,
         args: ChatMessagesRouteArgs(key: key, ticketModel: ticketModel),
         initialChildren: children,
       );

  static const String name = 'ChatMessagesRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatMessagesRouteArgs>();
      return _i7.ChatMessagesScreen(
        key: args.key,
        ticketModel: args.ticketModel,
      );
    },
  );
}

class ChatMessagesRouteArgs {
  const ChatMessagesRouteArgs({this.key, required this.ticketModel});

  final _i32.Key? key;

  final _i36.TicketModel ticketModel;

  @override
  String toString() {
    return 'ChatMessagesRouteArgs{key: $key, ticketModel: $ticketModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatMessagesRouteArgs) return false;
    return key == other.key && ticketModel == other.ticketModel;
  }

  @override
  int get hashCode => key.hashCode ^ ticketModel.hashCode;
}

/// generated route for
/// [_i8.CreateInsuranceProfileScreen]
class CreateInsuranceProfileRoute
    extends _i31.PageRouteInfo<CreateInsuranceProfileRouteArgs> {
  CreateInsuranceProfileRoute({
    _i32.Key? key,
    _i37.InsuranceProfileModel? model,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         CreateInsuranceProfileRoute.name,
         args: CreateInsuranceProfileRouteArgs(key: key, model: model),
         initialChildren: children,
       );

  static const String name = 'CreateInsuranceProfileRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateInsuranceProfileRouteArgs>(
        orElse: () => const CreateInsuranceProfileRouteArgs(),
      );
      return _i8.CreateInsuranceProfileScreen(key: args.key, model: args.model);
    },
  );
}

class CreateInsuranceProfileRouteArgs {
  const CreateInsuranceProfileRouteArgs({this.key, this.model});

  final _i32.Key? key;

  final _i37.InsuranceProfileModel? model;

  @override
  String toString() {
    return 'CreateInsuranceProfileRouteArgs{key: $key, model: $model}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateInsuranceProfileRouteArgs) return false;
    return key == other.key && model == other.model;
  }

  @override
  int get hashCode => key.hashCode ^ model.hashCode;
}

/// generated route for
/// [_i9.FavouriteProductsScreen]
class FavouriteProductsRoute extends _i31.PageRouteInfo<void> {
  const FavouriteProductsRoute({List<_i31.PageRouteInfo>? children})
    : super(FavouriteProductsRoute.name, initialChildren: children);

  static const String name = 'FavouriteProductsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i9.FavouriteProductsScreen();
    },
  );
}

/// generated route for
/// [_i10.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i31.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i31.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i10.ForgotPasswordScreen();
    },
  );
}

/// generated route for
/// [_i11.HomeScreen]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i11.HomeScreen();
    },
  );
}

/// generated route for
/// [_i12.InsuranceProfileScreen]
class InsuranceProfileRoute extends _i31.PageRouteInfo<void> {
  const InsuranceProfileRoute({List<_i31.PageRouteInfo>? children})
    : super(InsuranceProfileRoute.name, initialChildren: children);

  static const String name = 'InsuranceProfileRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i12.InsuranceProfileScreen();
    },
  );
}

/// generated route for
/// [_i13.LocationsScreen]
class LocationsRoute extends _i31.PageRouteInfo<void> {
  const LocationsRoute({List<_i31.PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i13.LocationsScreen();
    },
  );
}

/// generated route for
/// [_i14.LoginScreen]
class LoginRoute extends _i31.PageRouteInfo<void> {
  const LoginRoute({List<_i31.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i14.LoginScreen();
    },
  );
}

/// generated route for
/// [_i15.MainLayoutScreen]
class MainLayoutRoute extends _i31.PageRouteInfo<MainLayoutRouteArgs> {
  MainLayoutRoute({
    _i32.Key? key,
    int? initialIndex,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         MainLayoutRoute.name,
         args: MainLayoutRouteArgs(key: key, initialIndex: initialIndex),
         initialChildren: children,
       );

  static const String name = 'MainLayoutRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MainLayoutRouteArgs>(
        orElse: () => const MainLayoutRouteArgs(),
      );
      return _i15.MainLayoutScreen(
        key: args.key,
        initialIndex: args.initialIndex,
      );
    },
  );
}

class MainLayoutRouteArgs {
  const MainLayoutRouteArgs({this.key, this.initialIndex});

  final _i32.Key? key;

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
/// [_i16.NotificationsScreen]
class NotificationsRoute extends _i31.PageRouteInfo<void> {
  const NotificationsRoute({List<_i31.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i16.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i17.OnBoardingScreen]
class OnBoardingRoute extends _i31.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i31.PageRouteInfo>? children})
    : super(OnBoardingRoute.name, initialChildren: children);

  static const String name = 'OnBoardingRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i17.OnBoardingScreen();
    },
  );
}

/// generated route for
/// [_i18.OrderDetailsPage]
class OrderDetailsRoute extends _i31.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i32.Key? key,
    required _i38.Orders order,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         OrderDetailsRoute.name,
         args: OrderDetailsRouteArgs(key: key, order: order),
         initialChildren: children,
       );

  static const String name = 'OrderDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return _i18.OrderDetailsPage(key: args.key, order: args.order);
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({this.key, required this.order});

  final _i32.Key? key;

  final _i38.Orders order;

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
/// [_i19.OrdersScreen]
class OrdersRoute extends _i31.PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    _i32.Key? key,
    required String type,
    required String title,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         OrdersRoute.name,
         args: OrdersRouteArgs(key: key, type: type, title: title),
         initialChildren: children,
       );

  static const String name = 'OrdersRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrdersRouteArgs>();
      return _i19.OrdersScreen(
        key: args.key,
        type: args.type,
        title: args.title,
      );
    },
  );
}

class OrdersRouteArgs {
  const OrdersRouteArgs({this.key, required this.type, required this.title});

  final _i32.Key? key;

  final String type;

  final String title;

  @override
  String toString() {
    return 'OrdersRouteArgs{key: $key, type: $type, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OrdersRouteArgs) return false;
    return key == other.key && type == other.type && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ type.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i20.OtpScreen]
class OtpRoute extends _i31.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i32.Key? key,
    required String email,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         OtpRoute.name,
         args: OtpRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'OtpRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpRouteArgs>();
      return _i20.OtpScreen(key: args.key, email: args.email);
    },
  );
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.email});

  final _i32.Key? key;

  final String email;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i21.PickLocationScreen]
class PickLocationRoute extends _i31.PageRouteInfo<void> {
  const PickLocationRoute({List<_i31.PageRouteInfo>? children})
    : super(PickLocationRoute.name, initialChildren: children);

  static const String name = 'PickLocationRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i21.PickLocationScreen();
    },
  );
}

/// generated route for
/// [_i22.PrescriptionScreen]
class PrescriptionRoute extends _i31.PageRouteInfo<PrescriptionRouteArgs> {
  PrescriptionRoute({
    _i32.Key? key,
    required bool isInsurance,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         PrescriptionRoute.name,
         args: PrescriptionRouteArgs(key: key, isInsurance: isInsurance),
         initialChildren: children,
       );

  static const String name = 'PrescriptionRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrescriptionRouteArgs>();
      return _i22.PrescriptionScreen(
        key: args.key,
        isInsurance: args.isInsurance,
      );
    },
  );
}

class PrescriptionRouteArgs {
  const PrescriptionRouteArgs({this.key, required this.isInsurance});

  final _i32.Key? key;

  final bool isInsurance;

  @override
  String toString() {
    return 'PrescriptionRouteArgs{key: $key, isInsurance: $isInsurance}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PrescriptionRouteArgs) return false;
    return key == other.key && isInsurance == other.isInsurance;
  }

  @override
  int get hashCode => key.hashCode ^ isInsurance.hashCode;
}

/// generated route for
/// [_i23.PrivacyScreen]
class PrivacyRoute extends _i31.PageRouteInfo<PrivacyRouteArgs> {
  PrivacyRoute({
    _i32.Key? key,
    required String title,
    required num id,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         PrivacyRoute.name,
         args: PrivacyRouteArgs(key: key, title: title, id: id),
         initialChildren: children,
       );

  static const String name = 'PrivacyRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrivacyRouteArgs>();
      return _i23.PrivacyScreen(key: args.key, title: args.title, id: args.id);
    },
  );
}

class PrivacyRouteArgs {
  const PrivacyRouteArgs({this.key, required this.title, required this.id});

  final _i32.Key? key;

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
/// [_i24.ProductDetailsScreen]
class ProductDetailsRoute extends _i31.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    _i32.Key? key,
    required _i39.ProductModel product,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(key: key, product: product),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return _i24.ProductDetailsScreen(key: args.key, product: args.product);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.product});

  final _i32.Key? key;

  final _i39.ProductModel product;

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
/// [_i25.RegisterScreen]
class RegisterRoute extends _i31.PageRouteInfo<void> {
  const RegisterRoute({List<_i31.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i25.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i26.ResetPasswordScreen]
class ResetPasswordRoute extends _i31.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    _i32.Key? key,
    required String email,
    List<_i31.PageRouteInfo>? children,
  }) : super(
         ResetPasswordRoute.name,
         args: ResetPasswordRouteArgs(key: key, email: email),
         initialChildren: children,
       );

  static const String name = 'ResetPasswordRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return _i26.ResetPasswordScreen(key: args.key, email: args.email);
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.email});

  final _i32.Key? key;

  final String email;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, email: $email}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResetPasswordRouteArgs) return false;
    return key == other.key && email == other.email;
  }

  @override
  int get hashCode => key.hashCode ^ email.hashCode;
}

/// generated route for
/// [_i27.SettingsScreen]
class SettingsRoute extends _i31.PageRouteInfo<void> {
  const SettingsRoute({List<_i31.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i27.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i28.SplashScreen]
class SplashRoute extends _i31.PageRouteInfo<void> {
  const SplashRoute({List<_i31.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i28.SplashScreen();
    },
  );
}

/// generated route for
/// [_i29.SupportChatScreen]
class SupportChatRoute extends _i31.PageRouteInfo<void> {
  const SupportChatRoute({List<_i31.PageRouteInfo>? children})
    : super(SupportChatRoute.name, initialChildren: children);

  static const String name = 'SupportChatRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i29.SupportChatScreen();
    },
  );
}

/// generated route for
/// [_i30.UpdateProfileScreen]
class UpdateProfileRoute extends _i31.PageRouteInfo<void> {
  const UpdateProfileRoute({List<_i31.PageRouteInfo>? children})
    : super(UpdateProfileRoute.name, initialChildren: children);

  static const String name = 'UpdateProfileRoute';

  static _i31.PageInfo page = _i31.PageInfo(
    name,
    builder: (data) {
      return const _i30.UpdateProfileScreen();
    },
  );
}
