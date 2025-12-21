import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: OtpRoute.page),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(
      page: MainLayoutRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: FavouriteProductsRoute.page),
        AutoRoute(page: CartRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
    AutoRoute(page: AllProductsRoute.page),
  ];
}
