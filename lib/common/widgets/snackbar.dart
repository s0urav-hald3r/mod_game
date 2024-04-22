import 'package:flutter/material.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:mod_game/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class XSnackBar {
  XSnackBar._();

  static show(String title, String message, String type) {
    Color? bgColor;
    Color? textColor = XColor.white;
    switch (type) {
      case 'success':
        bgColor = XColor.success;
        break;
      case 'warning':
        bgColor = XColor.warning;
        break;
      case 'error':
        bgColor = XColor.error;
        break;
      default:
    }
    Get.snackbar('', '',
        titleText: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: XSize.fontSizeL,
              color: textColor,
              fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          message,
          style:
              GoogleFonts.poppins(fontSize: XSize.fontSizeS, color: textColor),
        ),
        backgroundColor: bgColor);
  }
}
