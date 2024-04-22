import 'package:flutter/material.dart';

/// Custom Class for Light & Dark IconButton Themes

class XIconButtonTheme {
  XIconButtonTheme._(); // To avoid creating instances

  /// Customizable Light IconButton Theme
  static IconButtonThemeData lightIconButtonTheme = const IconButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)));

  /// Customizable Dark IconButton Theme
  static IconButtonThemeData darkIconButtonTheme = const IconButtonThemeData(
      style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.zero)));
}
