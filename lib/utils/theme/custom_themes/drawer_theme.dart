import 'package:flutter/material.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Drawer Themes

class XDrawerTheme {
  XDrawerTheme._(); // To avoid creating instances

  /// Customizable Light Drawer Theme
  static DrawerThemeData lightDrawerTheme = const DrawerThemeData(
      backgroundColor: XColor.scaffoldLigthBackgroundColor);

  /// Customizable Dark Drawer Theme
  static DrawerThemeData darkDrawerTheme = const DrawerThemeData(
      backgroundColor: XColor.scaffoldDarkBackgroundColor);
}
