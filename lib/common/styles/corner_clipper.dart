import 'package:flutter/material.dart';
import 'package:mod_game/utils/helper/extension.dart';

class CornerClipper extends CustomClipper<Path> {
  final double vPoint;
  final double hPoint;

  CornerClipper({
    required this.vPoint,
    required this.hPoint,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height.percentage(vPoint));

    path.lineTo(0, size.height);
    path.lineTo(size.width.percentage(hPoint), size.height);
    path.lineTo(size.width, size.height - size.height.percentage(vPoint));
    path.lineTo(size.width, 0);
    path.lineTo(size.width - size.width.percentage(hPoint), 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
