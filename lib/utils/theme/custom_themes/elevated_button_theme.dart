import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// -- Light & Dark Elevated Button Themes

class XElevatedButtonTheme {
  XElevatedButtonTheme._(); //To avoid creating instances

  ///-- Light Theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: XColor.white,
      backgroundColor: XColor.primaryColor,
      disabledForegroundColor: XColor.foregroundGrey,
      disabledBackgroundColor: XColor.backgroundGrey,
      side: BorderSide(color: XColor.primaryColor),
      minimumSize: Size.zero,
      textStyle: GoogleFonts.poppins(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ); // Elevated Button ThemeData

  /// Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: XColor.white,
      backgroundColor: XColor.primaryColor,
      disabledForegroundColor: XColor.foregroundGrey,
      disabledBackgroundColor: XColor.backgroundGrey,
      side: BorderSide(color: XColor.primaryColor),
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      textStyle: GoogleFonts.poppins(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ); // ElevatedButtonThemeData
}
