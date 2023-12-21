import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

BottomNavigationBar bottomNavigationBar(context, void Function(int)? ontap) {
  return BottomNavigationBar(
    selectedFontSize: 0,
    unselectedFontSize: 0,
    iconSize: 30,
    onTap: ontap,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(
          Ionicons.planet,
        ),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.bag_handle_outline),
        label: "Shop",
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.cart_outline),
        label: "cart",
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.cog_outline),
        label: "Settings",
      ),
      BottomNavigationBarItem(
        icon: Icon(Ionicons.person_outline),
        label: "Profile",
      ),
    ],
  );
}
