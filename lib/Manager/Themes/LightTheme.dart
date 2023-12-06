import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/Themes/colors/LightColors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  static var set = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightColor.bgColor,
    fontFamily: "Lato",
    useMaterial3: true,
    primaryColor: ThemeData.light(useMaterial3: true).scaffoldBackgroundColor,
    //=============== APP BAR
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: LightColor.bgColor,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: LightColor.iconColor,
      ),
      actionsIconTheme: IconThemeData(
        color: LightColor.iconColor,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // Navigation bar
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    //=============== INPUT STYLES
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      enabledBorder: OutlineInputBorder(
        gapPadding: 5,
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 5,
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        gapPadding: 5,
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        gapPadding: 5,
        borderRadius: BorderRadius.circular(0),
        borderSide: BorderSide(width: 1, color: AppColors.inputBorderColor),
      ),
      labelStyle: TextStyle(
        color: AppColors.inputLabelColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.inputLabelColor,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    //=============== BUTTON COLOR
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          LightColor.elevatedButtonColor,
        ),
        iconColor: MaterialStatePropertyAll(LightColor.textColor),
        textStyle:
            MaterialStatePropertyAll(TextStyle(color: LightColor.textColor)),
        foregroundColor: MaterialStatePropertyAll(LightColor.textColor),
        elevation: const MaterialStatePropertyAll(0),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
    ),
    //============ textSelectionTheme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Color.fromARGB(255, 197, 197, 197),
      selectionHandleColor: Colors.black,
    ),
    //============ BOTTOM NAVIGATION BAR
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColor.bgColor,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      elevation: 0.0,
      enableFeedback: false,
      selectedItemColor: LightColor.textColor,
      unselectedItemColor: LightColor.textColor,
      unselectedIconTheme: IconThemeData(
        color: LightColor.textColor.withOpacity(0.5),
        size: 25,
      ),
      selectedIconTheme: IconThemeData(
        color: LightColor.textColor,
        size: 25,
      ),
    ),
    //=============== Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(0.0),
        foregroundColor: MaterialStatePropertyAll(LightColor.textColor),
      ),
    ),
    //=============== DRAWER
    drawerTheme: DrawerThemeData(
      backgroundColor: LightColor.bgColor,
      elevation: 0.0,
    ),
    //=============== LIST TILE
    listTileTheme: ListTileThemeData(
      iconColor: LightColor.textColor,
      textColor: LightColor.textColor,
    ),
    //=============== TEXT STYLES
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: LightColor.textColor,
        fontWeight: FontWeight.w400,
      ),
    ),
  ).copyWith(
    splashFactory: NoSplash.splashFactory,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
