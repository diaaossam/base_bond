import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';

enum UserNavItem {
  home,
  favourite,
  orders,
  cart,
  settings;

  String get title => switch (this) {
    UserNavItem.home => S.current.home,
    UserNavItem.favourite => S.current.favorites,
    UserNavItem.orders => S.current.myOrders,
    UserNavItem.cart => S.current.cart,
    UserNavItem.settings => S.current.settings,
  };

  String get activeIcon => switch (this) {
    UserNavItem.home => Assets.icons.homeActive,
    UserNavItem.favourite => Assets.icons.heart2,
    UserNavItem.orders => Assets.icons.myOrders,
    UserNavItem.cart => Assets.icons.shoppingCart,
    UserNavItem.settings => Assets.icons.settings,
  };

  String get inActiveIcon => switch (this) {
    UserNavItem.home => Assets.icons.homeInactive,
    UserNavItem.favourite => Assets.icons.heart2,
    UserNavItem.orders => Assets.icons.myOrders,
    UserNavItem.cart => Assets.icons.shoppingCart,
    UserNavItem.settings => Assets.icons.settings,
  };
}
