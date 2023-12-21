import 'package:flutter/material.dart';

Color themeColor(context, {Color? darkModeColor, Color? lightModeColor}) {
  return Theme.of(context).brightness == Brightness.dark
      ? darkModeColor ?? Colors.white
      : lightModeColor ?? Colors.black;
}
