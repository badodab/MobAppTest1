import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.red,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.teal,
  );
}
