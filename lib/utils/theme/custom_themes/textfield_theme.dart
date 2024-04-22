import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

/// -- Light & Dark TextField Themes

class XTextFieldTheme {
  XTextFieldTheme._();

  ///-- Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: XColor.foregroundGrey,
    suffixIconColor: XColor.foregroundGrey,
    labelStyle: GoogleFonts.poppins()
        .copyWith(fontSize: 13.sp, color: XColor.darkTextColor),
    hintStyle: GoogleFonts.poppins(fontSize: 10.sp, color: XColor.error)
        .copyWith(fontSize: 12.sp, color: XColor.darkTextColor.withOpacity(.5)),
    errorStyle: GoogleFonts.poppins(fontSize: 11.sp, color: XColor.error),
    floatingLabelStyle: GoogleFonts.poppins()
        .copyWith(color: XColor.darkTextColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: XColor.foregroundGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: XColor.foregroundGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: XColor.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(width: 1, color: XColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(width: 2, color: XColor.error),
    ),
  ); // InputDecoration Theme

  ///-- Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: XColor.backgroundGrey,
    suffixIconColor: XColor.backgroundGrey,
    labelStyle: GoogleFonts.poppins()
        .copyWith(fontSize: 13.sp, color: XColor.lightTextColor),
    hintStyle: GoogleFonts.poppins().copyWith(
        fontSize: 12.sp, color: XColor.lightTextColor.withOpacity(.5)),
    errorStyle: GoogleFonts.poppins(fontSize: 11.sp, color: XColor.error),
    floatingLabelStyle: GoogleFonts.poppins()
        .copyWith(color: XColor.lightTextColor.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: XColor.backgroundGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(width: 1, color: XColor.backgroundGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(width: 1, color: XColor.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(width: 1, color: XColor.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: const BorderSide(width: 2, color: XColor.error),
    ),
  );
}
