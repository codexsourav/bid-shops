import 'package:flutter/material.dart';

Widget progress(context) {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black),
    strokeCap: StrokeCap.round,
    strokeWidth: 2,
  );
}
