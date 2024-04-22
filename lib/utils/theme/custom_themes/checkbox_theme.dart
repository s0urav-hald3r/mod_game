import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark CheckBox Themes

class XCheckboxTheme {
  XCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light CheckBox Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.white;
      } else {
        return Colors.transparent;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
    side: BorderSide(color: XColor.primaryColor, width: 2.sp),
  ); // CheckboxTheme Data

  /// Customizable Dark CheckBox Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.white;
      } else {
        return Colors.transparent;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
    side: BorderSide(color: XColor.primaryColor, width: 2.sp),
  );
}
