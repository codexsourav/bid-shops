import 'package:auto_route/auto_route.dart';
import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RaferPage extends StatelessWidget {
  const RaferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            NavigateMe.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 20,
          ),
        ),
        title: const Text("Refer And Earn"),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              "assets/refer.png",
              width: MediaQuery.of(context).size.width - 80,
            ),
          ),
          Text("Refer And Earn"),
        ],
      ),
    );
  }
}
