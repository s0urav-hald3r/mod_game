import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
/* Light & Dark Outlined Button Themes -- */

class XOutlinedButtonTheme {
  XOutlinedButtonTheme._(); //To avoid creating instances

/* Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: XColor.primaryColor,
      disabledForegroundColor: XColor.primaryColor.withOpacity(.5),
      side: BorderSide(color: XColor.primaryColor),
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      textStyle: GoogleFonts.poppins(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ); // OutlinedButtonThemeData

/* Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: XColor.primaryColor,
      disabledForegroundColor: XColor.primaryColor.withOpacity(.5),
      side: BorderSide(color: XColor.primaryColor),
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      textStyle: GoogleFonts.poppins(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  ); // Outlined Button ThemeData
}
