import 'package:bid_and_shops/Manager/Themes/colors/AppColors.dart';
import 'package:bid_and_shops/Manager/Themes/colors/Darkcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  static var set = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColors.bgColor,
    fontFamily: "Lato",
    useMaterial3: true,
    primaryColor: ThemeData.light(useMaterial3: true).scaffoldBackgroundColor,
    //=============== APP BAR
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: DarkColors.bgColor,
      elevation: 0.0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // Navigation bar
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
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
        color: Color.fromARGB(225, 255, 255, 255),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      floatingLabelStyle: TextStyle(
        color: Color.fromARGB(225, 255, 255, 255),
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    //=============== BUTTON COLOR
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          DarkColors.elevatedButtonColor,
        ),
        textStyle:
            MaterialStatePropertyAll(TextStyle(color: DarkColors.textColor)),
        foregroundColor: MaterialStatePropertyAll(DarkColors.textColor),
        elevation: const MaterialStatePropertyAll(0),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
        ),
      ),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Color.fromARGB(255, 197, 197, 197),
      selectionHandleColor: Color.fromARGB(255, 250, 235, 29),
    ),
    //============ BOTTOM NAVIGATION BAR
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColors.bgColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0.0,
      enableFeedback: false,
      selectedItemColor: DarkColors.textColor,
      unselectedItemColor: DarkColors.textColor,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: DarkColors.textColor.withOpacity(0.5),
        size: 25,
      ),
      selectedIconTheme: IconThemeData(
        color: DarkColors.textColor,
        size: 25,
      ),
    ),
    //=============== Text Button
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0.0),
        foregroundColor: MaterialStatePropertyAll(DarkColors.textColor),
      ),
    ),
    //=============== DRAWER
    drawerTheme: DrawerThemeData(
      backgroundColor: DarkColors.bgColor,
      elevation: 0.0,
    ),
    //=============== LIST TILE
    listTileTheme: ListTileThemeData(
      iconColor: DarkColors.textColor,
      textColor: DarkColors.textColor,
    ),

    //=========CPI

    //=============== TEXT STYLES
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      displayLarge: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: DarkColors.textColor,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: DarkColors.textColor,
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
