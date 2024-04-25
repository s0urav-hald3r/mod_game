import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InnerBoxPainter extends CustomPainter {
  final Color color;

  InnerBoxPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 0.75.sp
      ..style = PaintingStyle.stroke;

    path.moveTo(0, 8.sp);

    path.lineTo(0, size.height);
    path.lineTo(52.sp, size.height);
    path.lineTo(size.width, 52.sp);
    path.lineTo(size.width, 0);
    path.lineTo(8.sp, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(InnerBoxPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(InnerBoxPainter oldDelegate) => false;
}
