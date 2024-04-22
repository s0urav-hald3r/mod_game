import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class XTextTheme {
  XTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins().copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: XColor.darkTextColor),
    headlineMedium: GoogleFonts.poppins().copyWith(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: XColor.darkTextColor),
    headlineSmall: GoogleFonts.poppins().copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor),
    titleLarge: GoogleFonts.poppins().copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: XColor.darkTextColor),
    titleMedium: GoogleFonts.poppins().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor),
    titleSmall: GoogleFonts.poppins().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor),
    bodyLarge: GoogleFonts.poppins().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: XColor.darkTextColor),
    bodyMedium: GoogleFonts.poppins().copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.normal,
        color: XColor.darkTextColor),
    bodySmall: GoogleFonts.poppins().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor.withOpacity(0.75)),
  ); // TextTheme

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.poppins().copyWith(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: XColor.lightTextColor),
    headlineMedium: GoogleFonts.poppins().copyWith(
        fontSize: 28.sp,
        fontWeight: FontWeight.w600,
        color: XColor.lightTextColor),
    headlineSmall: GoogleFonts.poppins().copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    titleLarge: GoogleFonts.poppins().copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: XColor.lightTextColor),
    titleMedium: GoogleFonts.poppins().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    titleSmall: GoogleFonts.poppins().copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    bodyLarge: GoogleFonts.poppins().copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: XColor.lightTextColor),
    bodyMedium: GoogleFonts.poppins().copyWith(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    bodySmall: GoogleFonts.poppins().copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: XColor.lightTextColor.withOpacity(0.5)),
  ); // TextTheme
}
