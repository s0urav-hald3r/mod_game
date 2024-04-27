import 'package:flutter/material.dart';
import 'package:mod_game/utils/helper/extension.dart';

class CornerPainter extends CustomPainter {
  final Color color;
  final double stroke;
  final double vPoint;
  final double hPoint;

  CornerPainter({
    required this.stroke,
    required this.color,
    required this.vPoint,
    required this.hPoint,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = stroke
      ..style = PaintingStyle.stroke;

    path.moveTo(0, size.height.percentage(vPoint));

    path.lineTo(0, size.height);
    path.lineTo(size.width.percentage(hPoint), size.height);
    path.lineTo(size.width, size.height - size.height.percentage(vPoint));
    path.lineTo(size.width, 0);
    path.lineTo(size.width - size.width.percentage(hPoint), 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CornerPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CornerPainter oldDelegate) => false;
}
