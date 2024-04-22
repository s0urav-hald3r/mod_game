import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Chip Themes

class XChipTheme {
  XChipTheme._(); // To avoid creating instances

  /// Customizable Light Chip Theme
  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: XColor.softGrey,
    labelStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: XColor.darkTextColor),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: XColor.darkGrey,
      ),
      borderRadius: BorderRadius.circular(12.r),
    ),
    iconTheme: IconThemeData(color: XColor.darkerGrey, size: 20.sp),
  );

  /// Customizable Dark Chip Theme
  static ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: XColor.darkGrey,
    labelStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        fontWeight: FontWeight.w500,
        color: XColor.lightTextColor),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: XColor.softGrey,
      ),
      borderRadius: BorderRadius.circular(12.r),
    ),
    iconTheme: IconThemeData(color: XColor.lightGrey, size: 20.sp),
  );
}
