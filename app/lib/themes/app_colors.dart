import 'package:flutter/material.dart';

class AppColors {
  static const text1 = Color(0xFF52443D);

  static const white = Color(0xFFFAFAFA);
  static const pink = Color(0xFFFFDBCB);

  static const int _primaryValue = 0xFF9E4300;
  static const MaterialColor primaryColor = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFFFEDE6),
      100: Color(0xFFFFDBCB),
      200: Color(0xFFFFB690),
      300: Color(0xFFFF8D4C),
      400: Color(0xFFE86D1C),
      500: Color(0xFFC55500),
      600: Color(_primaryValue),
      700: Color(0xFF783100),
      800: Color(0xFF552100),
      900: Color(0xFF341100),
    },
  );
}
