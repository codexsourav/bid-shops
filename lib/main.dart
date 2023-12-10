import 'package:bid_and_shops/Manager/Themes/DarkTheme.dart';
import 'package:bid_and_shops/Manager/Themes/LightTheme.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:bid_and_shops/Provider/ManageBidsProvider.dart';
import 'package:bid_and_shops/Provider/UserProfileProvider.dart';
import 'package:bid_and_shops/Provider/WishListProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));
  runApp(
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
        ChangeNotifierProvider(create: (_) => ManageWishList()),
        ChangeNotifierProvider(create: (_) => ManageCartList()),
        ChangeNotifierProvider(create: (_) => ManageBidProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRouters appRouters = AppRouters();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.set,
      darkTheme: DarkTheme.set,
      themeMode: ThemeMode.system,
      routerConfig: appRouters.config(),
    );
  }
}
