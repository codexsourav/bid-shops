import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Provider/CartProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

AppBar ProductAppbar(BuildContext context,
    {onBack, onCartTap, transparent = false, Widget? title}) {
  return AppBar(
    forceMaterialTransparency: transparent,
    title: title,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: onBack != null ? () => onBack() : () => NavigateMe.pop(context),
        child: const Center(
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
            ),
          ),
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: onCartTap,
        child: Center(
          child: Badge(
            backgroundColor: AppColors.primaryColorDark,
            label: Consumer<ManageCartList>(
              builder: (context, value, child) {
                return Text(
                  value.cartData.length.toString(),
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                );
              },
            ),
            child: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                FontAwesomeIcons.shoppingCart,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 18)
    ],
  );
}
