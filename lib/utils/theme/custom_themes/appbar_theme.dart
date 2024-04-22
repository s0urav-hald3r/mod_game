import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Appbar Themes

class XAppbarTheme {
  XAppbarTheme._(); //To avoid creating instances

/* Light Theme -- */
  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: XColor.black, size: 20.sp),
    actionsIconTheme: IconThemeData(color: XColor.black, size: 20.sp),
    titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ); // AppBar Theme // TextButtonThemeData

/* Dark Theme -- */
  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: XColor.white, size: 20.sp),
    actionsIconTheme: IconThemeData(color: XColor.white, size: 20.sp),
    titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
