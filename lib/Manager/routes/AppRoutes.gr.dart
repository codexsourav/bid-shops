// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:bid_and_shops/Screens/Auth/ForgetPassword.dart' as _i4;
import 'package:bid_and_shops/Screens/Auth/LoginPage.dart' as _i6;
import 'package:bid_and_shops/Screens/Auth/OtpPage.dart' as _i7;
import 'package:bid_and_shops/Screens/Auth/SignupPage.dart' as _i12;
import 'package:bid_and_shops/Screens/Pages/CartPage.dart' as _i3;
import 'package:bid_and_shops/Screens/Pages/HomePage.dart' as _i5;
import 'package:bid_and_shops/Screens/Pages/RaferPage.dart' as _i9;
import 'package:bid_and_shops/Screens/Pages/SettingsPage.dart' as _i10;
import 'package:bid_and_shops/Screens/Pages/ViewWinnersPage.dart' as _i14;
import 'package:bid_and_shops/Screens/Shop/BidExploreShop.dart' as _i1;
import 'package:bid_and_shops/Screens/Shop/BidShop.dart' as _i2;
import 'package:bid_and_shops/Screens/Shop/ProductLandingPage.dart' as _i8;
import 'package:bid_and_shops/Screens/Shop/Shop.dart' as _i11;
import 'package:bid_and_shops/Screens/SplashScreen.dart' as _i13;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouters extends _i15.RootStackRouter {
  $AppRouters({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    BidExploreSection.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BidExploreSection(),
      );
    },
    BidShop.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BidShop(),
      );
    },
    CartRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartPage(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordRouteArgs>(
          orElse: () => const ForgetPasswordRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ForgetPasswordPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginPage(key: args.key),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OtpPage(
          key: args.key,
          mobile: args.mobile,
        ),
      );
    },
    ProductLandingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProductLandingPage(),
      );
    },
    RaferRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RaferPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsPage(),
      );
    },
    Shop.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Shop(),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.SignupPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreen(),
      );
    },
    ViewWinners.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ViewWinners(),
      );
    },
  };
}

/// generated route for
/// [_i1.BidExploreSection]
class BidExploreSection extends _i15.PageRouteInfo<void> {
  const BidExploreSection({List<_i15.PageRouteInfo>? children})
      : super(
          BidExploreSection.name,
          initialChildren: children,
        );

  static const String name = 'BidExploreSection';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BidShop]
class BidShop extends _i15.PageRouteInfo<void> {
  const BidShop({List<_i15.PageRouteInfo>? children})
      : super(
          BidShop.name,
          initialChildren: children,
        );

  static const String name = 'BidShop';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i15.PageRouteInfo<void> {
  const CartRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ForgetPasswordPage]
class ForgetPasswordRoute extends _i15.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i15.PageInfo<ForgetPasswordRouteArgs> page =
      _i15.PageInfo<ForgetPasswordRouteArgs>(name);
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i15.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i15.PageInfo<HomeRouteArgs> page =
      _i15.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i15.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i15.PageInfo<LoginRouteArgs> page =
      _i15.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.OtpPage]
class OtpRoute extends _i15.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i16.Key? key,
    required dynamic mobile,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            mobile: mobile,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i15.PageInfo<OtpRouteArgs> page =
      _i15.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.mobile,
  });

  final _i16.Key? key;

  final dynamic mobile;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, mobile: $mobile}';
  }
}

/// generated route for
/// [_i8.ProductLandingPage]
class ProductLandingRoute extends _i15.PageRouteInfo<void> {
  const ProductLandingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ProductLandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductLandingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RaferPage]
class RaferRoute extends _i15.PageRouteInfo<void> {
  const RaferRoute({List<_i15.PageRouteInfo>? children})
      : super(
          RaferRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaferRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Shop]
class Shop extends _i15.PageRouteInfo<void> {
  const Shop({List<_i15.PageRouteInfo>? children})
      : super(
          Shop.name,
          initialChildren: children,
        );

  static const String name = 'Shop';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignupPage]
class SignupRoute extends _i15.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i15.PageInfo<SignupRouteArgs> page =
      _i15.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i16.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.SplashScreen]
class SplashRoute extends _i15.PageRouteInfo<void> {
  const SplashRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ViewWinners]
class ViewWinners extends _i15.PageRouteInfo<void> {
  const ViewWinners({List<_i15.PageRouteInfo>? children})
      : super(
          ViewWinners.name,
          initialChildren: children,
        );

  static const String name = 'ViewWinners';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
