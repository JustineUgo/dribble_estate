
import 'package:flutter/material.dart';

class EstateColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color dark = Color(0xFF232220);
  static const Color primary = Color(0xFFA5957E);
  static const Color orange = Color(0xFFfc9e12);
}

class EstateTheme {
  
  static final ThemeData themeData = ThemeData(
    fontFamily: 'euclid_circular_a',
    brightness: Brightness.light,
    primaryColor: EstateColors.dark,
    scaffoldBackgroundColor: EstateColors.white,
  );
}
