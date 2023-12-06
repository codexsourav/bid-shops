import 'package:bid_and_shops/Helper/Navigate/NavigateMe.dart';
import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        child: Center(
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
            label: Text(
              "5",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                FontAwesomeIcons.shoppingCart,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      SizedBox(width: 18)
    ],
  );
}
