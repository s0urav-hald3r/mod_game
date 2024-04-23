import 'package:flutter/material.dart';
import 'package:mod_game/utils/helper/extension.dart';

class CornerClipper extends CustomClipper<Path> {
  final double startPoint;

  CornerClipper({required this.startPoint});

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height.percentage(startPoint));

    path.lineTo(0, size.height);
    path.lineTo(size.width.percentage(100 - startPoint), size.height);
    path.lineTo(size.width, size.height.percentage(100 - startPoint));
    path.lineTo(size.width, 0);
    path.lineTo(size.width.percentage(startPoint), 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
