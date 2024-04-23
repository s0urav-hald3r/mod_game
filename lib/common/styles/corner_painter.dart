import 'package:flutter/material.dart';
import 'package:mod_game/utils/helper/extension.dart';

class CornerPainter extends CustomPainter {
  final Color color;
  final double opacity;
  final double stroke;

  CornerPainter(
      {required this.stroke, required this.color, required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    path.moveTo(0, size.height.percentage(15));

    path.lineTo(0, size.height);
    path.lineTo(size.width.percentage(85), size.height);
    path.lineTo(size.width, size.height.percentage(85));
    path.lineTo(size.width, 0);
    path.lineTo(size.width.percentage(15), 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CornerPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CornerPainter oldDelegate) => false;
}
