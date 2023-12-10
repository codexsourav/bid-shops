// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:bid_and_shops/Screens/Auth/ForgetPassword.dart' as _i3;
import 'package:bid_and_shops/Screens/Auth/LoginPage.dart' as _i5;
import 'package:bid_and_shops/Screens/Auth/OtpPage.dart' as _i6;
import 'package:bid_and_shops/Screens/Auth/SignupPage.dart' as _i13;
import 'package:bid_and_shops/Screens/Pages/CartPage.dart' as _i2;
import 'package:bid_and_shops/Screens/Pages/HomePage.dart' as _i4;
import 'package:bid_and_shops/Screens/Pages/RaferPage.dart' as _i8;
import 'package:bid_and_shops/Screens/Pages/SettingsPage.dart' as _i10;
import 'package:bid_and_shops/Screens/Pages/ViewWinnersPage.dart' as _i15;
import 'package:bid_and_shops/Screens/Pages/WishListPage.dart' as _i16;
import 'package:bid_and_shops/Screens/Shop/BidShop.dart' as _i1;
import 'package:bid_and_shops/Screens/Shop/ProductLandingPage.dart' as _i7;
import 'package:bid_and_shops/Screens/Shop/searchPage.dart' as _i9;
import 'package:bid_and_shops/Screens/Shop/Shop.dart' as _i11;
import 'package:bid_and_shops/Screens/Shop/ShowBidsPage.dart' as _i12;
import 'package:bid_and_shops/Screens/SplashScreen.dart' as _i14;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouters extends _i17.RootStackRouter {
  $AppRouters({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    BidShop.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BidShop(),
      );
    },
    CartRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartPage(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgetPasswordRouteArgs>(
          orElse: () => const ForgetPasswordRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ForgetPasswordPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomePage(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginPage(key: args.key),
      );
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OtpPage(
          key: args.key,
          mobile: args.mobile,
        ),
      );
    },
    ProductLandingRoute.name: (routeData) {
      final args = routeData.argsAs<ProductLandingRouteArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ProductLandingPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    RaferRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RaferPage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.SearchPage(
          key: args.key,
          search: args.search,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SettingsPage(),
      );
    },
    Shop.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.Shop(),
      );
    },
    ShowBidsRoutee.name: (routeData) {
      final args = routeData.argsAs<ShowBidsRouteeArgs>(
          orElse: () => const ShowBidsRouteeArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.ShowBidsPagee(
          key: args.key,
          data: args.data,
        ),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SignupPage(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreen(),
      );
    },
    ViewWinners.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ViewWinners(),
      );
    },
    WishListRoute.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.WishListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BidShop]
class BidShop extends _i17.PageRouteInfo<void> {
  const BidShop({List<_i17.PageRouteInfo>? children})
      : super(
          BidShop.name,
          initialChildren: children,
        );

  static const String name = 'BidShop';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i17.PageRouteInfo<void> {
  const CartRoute({List<_i17.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordRoute extends _i17.PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ForgetPasswordRoute.name,
          args: ForgetPasswordRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i17.PageInfo<ForgetPasswordRouteArgs> page =
      _i17.PageInfo<ForgetPasswordRouteArgs>(name);
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i17.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i17.PageInfo<HomeRouteArgs> page =
      _i17.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i17.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i17.PageInfo<LoginRouteArgs> page =
      _i17.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.OtpPage]
class OtpRoute extends _i17.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({
    _i18.Key? key,
    required dynamic mobile,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          OtpRoute.name,
          args: OtpRouteArgs(
            key: key,
            mobile: mobile,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i17.PageInfo<OtpRouteArgs> page =
      _i17.PageInfo<OtpRouteArgs>(name);
}

class OtpRouteArgs {
  const OtpRouteArgs({
    this.key,
    required this.mobile,
  });

  final _i18.Key? key;

  final dynamic mobile;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, mobile: $mobile}';
  }
}

/// generated route for
/// [_i7.ProductLandingPage]
class ProductLandingRoute extends _i17.PageRouteInfo<ProductLandingRouteArgs> {
  ProductLandingRoute({
    _i18.Key? key,
    required Map<dynamic, dynamic> data,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ProductLandingRoute.name,
          args: ProductLandingRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductLandingRoute';

  static const _i17.PageInfo<ProductLandingRouteArgs> page =
      _i17.PageInfo<ProductLandingRouteArgs>(name);
}

class ProductLandingRouteArgs {
  const ProductLandingRouteArgs({
    this.key,
    required this.data,
  });

  final _i18.Key? key;

  final Map<dynamic, dynamic> data;

  @override
  String toString() {
    return 'ProductLandingRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i8.RaferPage]
class RaferRoute extends _i17.PageRouteInfo<void> {
  const RaferRoute({List<_i17.PageRouteInfo>? children})
      : super(
          RaferRoute.name,
          initialChildren: children,
        );

  static const String name = 'RaferRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SearchPage]
class SearchRoute extends _i17.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    _i18.Key? key,
    String search = "",
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            search: search,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i17.PageInfo<SearchRouteArgs> page =
      _i17.PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.search = "",
  });

  final _i18.Key? key;

  final String search;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, search: $search}';
  }
}

/// generated route for
/// [_i10.SettingsPage]
class SettingsRoute extends _i17.PageRouteInfo<void> {
  const SettingsRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Shop]
class Shop extends _i17.PageRouteInfo<void> {
  const Shop({List<_i17.PageRouteInfo>? children})
      : super(
          Shop.name,
          initialChildren: children,
        );

  static const String name = 'Shop';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ShowBidsPagee]
class ShowBidsRoutee extends _i17.PageRouteInfo<ShowBidsRouteeArgs> {
  ShowBidsRoutee({
    _i18.Key? key,
    Map<dynamic, dynamic>? data,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          ShowBidsRoutee.name,
          args: ShowBidsRouteeArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowBidsRoutee';

  static const _i17.PageInfo<ShowBidsRouteeArgs> page =
      _i17.PageInfo<ShowBidsRouteeArgs>(name);
}

class ShowBidsRouteeArgs {
  const ShowBidsRouteeArgs({
    this.key,
    this.data,
  });

  final _i18.Key? key;

  final Map<dynamic, dynamic>? data;

  @override
  String toString() {
    return 'ShowBidsRouteeArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i13.SignupPage]
class SignupRoute extends _i17.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i18.Key? key,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i17.PageInfo<SignupRouteArgs> page =
      _i17.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({this.key});

  final _i18.Key? key;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.SplashScreen]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute({List<_i17.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ViewWinners]
class ViewWinners extends _i17.PageRouteInfo<void> {
  const ViewWinners({List<_i17.PageRouteInfo>? children})
      : super(
          ViewWinners.name,
          initialChildren: children,
        );

  static const String name = 'ViewWinners';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.WishListPage]
class WishListRoute extends _i17.PageRouteInfo<void> {
  const WishListRoute({List<_i17.PageRouteInfo>? children})
      : super(
          WishListRoute.name,
          initialChildren: children,
        );

  static const String name = 'WishListRoute';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}
