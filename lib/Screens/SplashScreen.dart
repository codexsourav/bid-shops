import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Services/Storage/Storage.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UseLocalStorage storage = UseLocalStorage(storage: localStorage);
  void taskSplashScreen() async {
    if (await storage.storage.ready) {
      var jwt = await storage.getStorage(key: "authKey");
      if (jwt == null || jwt.isEmpty) {
        NavigateMe.replacePush(context, LoginRoute());
      } else {
        NavigateMe.replacePush(context, HomeRoute());
      }
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 2), () => taskSplashScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("APP LOGO"),
      ),
    );
  }
}
