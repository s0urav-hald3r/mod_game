import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InnerBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 8.sp);

    path.lineTo(0, size.height);
    path.lineTo(52.sp, size.height);
    path.lineTo(size.width, 52.sp);
    path.lineTo(size.width, 0);
    path.lineTo(8.sp, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
