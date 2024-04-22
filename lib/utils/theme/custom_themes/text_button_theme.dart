import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
/* Light & Dark Text Button Themes -- */

class XTextButtonTheme {
  XTextButtonTheme._(); //To avoid creating instances

/* Light Theme -- */
  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: XColor.primaryColor,
      textStyle:
          GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ); // TextButtonThemeData

/* Dark Theme -- */
  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: XColor.lightTextColor,
      textStyle:
          GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ); // Outlined Button ThemeData
}
