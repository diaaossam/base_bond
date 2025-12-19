import '../../../../gen/assets.gen.dart';
import '../../../../generated/l10n.dart';

enum UserNavItem {
  home,
  categories,
  favourite,
  cart,
  settings;

  String get title => switch (this) {
    UserNavItem.home => S.current.home,
    UserNavItem.categories => S.current.categories,
    UserNavItem.favourite => S.current.favorites,
    UserNavItem.cart => S.current.cart,
    UserNavItem.settings => S.current.settings,
  };

  String get activeIcon => switch (this) {
    UserNavItem.home => Assets.icons.homeActive,
    UserNavItem.categories => Assets.icons.category,
    UserNavItem.favourite => Assets.icons.heart2,
    UserNavItem.cart => Assets.icons.shoppingCart,
    UserNavItem.settings =>Assets.icons.settings,
  };

  String get inActiveIcon => switch (this) {
    UserNavItem.home => Assets.icons.homeInactive,
    UserNavItem.categories => Assets.icons.category,
    UserNavItem.favourite => Assets.icons.heart2,
    UserNavItem.cart => Assets.icons.shoppingCart,
    UserNavItem.settings =>Assets.icons.settings,
  };
}
