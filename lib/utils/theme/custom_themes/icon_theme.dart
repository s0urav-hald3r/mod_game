import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Icon Themes

class XIconTheme {
  XIconTheme._(); // To avoid creating instances

  /// Customizable Light Icon Theme
  static IconThemeData lightIconTheme =
      IconThemeData(color: XColor.darkerGrey, size: 26.sp);

  /// Customizable Dark Icon Theme
  static IconThemeData darkIconTheme =
      IconThemeData(color: XColor.lightGrey, size: 26.sp);
}
