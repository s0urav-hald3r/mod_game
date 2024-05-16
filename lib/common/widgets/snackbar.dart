import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants/colors.dart';

class XSnackBar {
  XSnackBar._();

  static show(String title, String message, int type) {
    Color? bgColor;
    Color? textColor = XColor.white;
    switch (type) {
      case 0:
        bgColor = XColor.primaryColor;
        break;
      case 1:
        bgColor = XColor.deepYellow;
        break;
      case 2:
        bgColor = Colors.red;
        break;
      default:
    }
    Get.snackbar('', '',
        titleText: Text(
          title,
          style: GoogleFonts.quantico(
              fontSize: 16.sp, color: textColor, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          message,
          style: GoogleFonts.quantico(fontSize: 14.sp, color: textColor),
        ),
        backgroundColor: bgColor,
        snackPosition: SnackPosition.BOTTOM);
  }
}
