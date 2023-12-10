import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/routes/AppRoutes.gr.dart';
import 'package:bid_and_shops/Screens/ComingSoon.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ExploreApp extends StatelessWidget {
  const ExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 20),
        //   child: Opacity(
        //     opacity: 0.6,
        //     child: Text(
        //       "EXPLORE SHOP",
        //       style: TextStyle(fontWeight: FontWeight.w600),
        //     ),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuIcons(
              title: "Shop",
              icon: Ionicons.bag_handle_outline,
              onTap: () {
                NavigateMe.push(context, Shop());
              },
            ),
            MenuIcons(
                title: "Winners",
                icon: Ionicons.trophy_outline,
                onTap: () {
                  NavigateMe.push(context, ViewWinners());
                }),
            MenuIcons(
                title: "Cart",
                icon: Ionicons.cart_outline,
                onTap: () {
                  NavigateMe.push(context, CartRoute());
                }),
            MenuIcons(title: "Orders", icon: Ionicons.cube_outline),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class MenuIcons extends StatelessWidget {
  final IconData? icon;
  final String title;
  final void Function()? onTap;
  const MenuIcons({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return ComingSoon();
              },
            ));
          },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Color.fromARGB(255, 34, 34, 34)
                  : Color.fromARGB(255, 239, 238, 243),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.7)
                  : Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "$title",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
