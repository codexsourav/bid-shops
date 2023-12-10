import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Manager/routes/AuthGard.dart';
import 'AppRoutes.gr.dart';

@AutoRouterConfig()
class AppRouters extends $AppRouters {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: SignupRoute.page, path: "/signup"),
        AutoRoute(page: ForgetPasswordRoute.page, path: "/forgetpassword"),
        AutoRoute(page: OtpRoute.page, path: "/otp"),
        AutoRoute(
          page: HomeRoute.page,
          path: "/home",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: BidShop.page,
          path: "/bidshop",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: Shop.page,
          path: "/shop",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ShowBidsRoutee.page,
          path: "/bidexploreshop",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ProductLandingRoute.page,
          path: "/product",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: CartRoute.page,
          path: "/cart",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: SearchRoute.page,
          path: "/search",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: "/setting",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: ViewWinners.page,
          path: "/winners",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: RaferRoute.page,
          path: "/refer",
          guards: [AuthGuard()],
        ),
        AutoRoute(
          page: WishListRoute.page,
          path: "/wishlist",
          guards: [AuthGuard()],
        ),
      ];
}
