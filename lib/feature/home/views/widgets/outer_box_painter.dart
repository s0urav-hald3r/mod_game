import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/utils/constants/colors.dart';

class OuterBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = XColor.primaryColor.withOpacity(0.3)
      ..strokeWidth = 1.sp
      ..style = PaintingStyle.stroke;

    path.moveTo(0, 10.sp);

    path.lineTo(0, size.height);
    path.lineTo(60.sp, size.height);
    path.lineTo(size.width, 60.sp);
    path.lineTo(size.width, 0);
    path.lineTo(10.sp, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(OuterBoxPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(OuterBoxPainter oldDelegate) => false;
}
