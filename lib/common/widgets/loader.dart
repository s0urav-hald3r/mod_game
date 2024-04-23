import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:mod_game/utils/constants/images.dart';

class XLoader {
  XLoader._();

  static show() {
    Get.dialog(
      Center(
        child: Container(
          color: Colors.transparent,
          width: 150.h,
          height: 150.h,
          child: Image.asset(XImage.loader),
        ),
      ),
      barrierDismissible: false,
      barrierColor: XColor.black.withOpacity(.75),
    );
  }

  static hide() {
    Get.back();
  }
}
