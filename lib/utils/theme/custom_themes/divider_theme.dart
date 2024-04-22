import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Divider Themes

class XDividerTheme {
  XDividerTheme._(); // To avoid creating instances

  /// Customizable Light Divider Theme
  static DividerThemeData lightDividerTheme =
      DividerThemeData(color: XColor.darkerGrey, thickness: 1.sp, space: 0);

  /// Customizable Dark Divider Theme
  static DividerThemeData darkDividerTheme =
      DividerThemeData(color: XColor.lightGrey, thickness: 1.sp, space: 0);
}
