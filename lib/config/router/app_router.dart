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
    AutoRoute(page: ForgotPasswordRoute.page),
    AutoRoute(page: ResetPasswordRoute.page),
    AutoRoute(page: OnBoardingRoute.page),
    AutoRoute(
      page: MainLayoutRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: FavouriteProductsRoute.page),
        AutoRoute(page: OrdersRoute.page),
        AutoRoute(page: CartRoute.page, maintainState: false),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
    AutoRoute(page: AllProductsRoute.page),
    AutoRoute(page: AllActiveSubstancesRoute.page),
    AutoRoute(page: ProductDetailsRoute.page),
    AutoRoute(page: PickLocationRoute.page),
    AutoRoute(page: AddAddressRoute.page),
    AutoRoute(page: PrivacyRoute.page),
    AutoRoute(page: CategoriesRoute.page),
    AutoRoute(page: CategoriesDetailsRoute.page),
    AutoRoute(page: LocationsRoute.page),
    AutoRoute(page: OrdersRoute.page),
    AutoRoute(page: OrderDetailsRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: UpdateProfileRoute.page),
    AutoRoute(page: PrescriptionRoute.page),
    AutoRoute(page: SupportChatRoute.page),
    AutoRoute(page: ChatMessagesRoute.page),
    AutoRoute(page: InsuranceProfileRoute.page),
    AutoRoute(page: CreateInsuranceProfileRoute.page),
    AutoRoute(page: PrescriptionOrderDetailsRoute.page),
    AutoRoute(page: OurBranchesRoute.page),
  ];
}
