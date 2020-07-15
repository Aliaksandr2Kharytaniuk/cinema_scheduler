import 'package:flutter/material.dart';

class ThemeProvider {
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  static TextTheme getTextTheme(BuildContext context) {
    return getTheme(context).textTheme;
  }
}
