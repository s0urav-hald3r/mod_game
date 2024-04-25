import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OuterBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 10.sp);

    path.lineTo(0, size.height);
    path.lineTo(60.sp, size.height);
    path.lineTo(size.width, 60.sp);
    path.lineTo(size.width, 0);
    path.lineTo(10.sp, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
