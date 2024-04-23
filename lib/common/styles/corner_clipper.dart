import 'package:flutter/material.dart';
import 'package:mod_game/utils/helper/extension.dart';

class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height.percentage(15));

    path.lineTo(0, size.height);
    path.lineTo(size.width.percentage(85), size.height);
    path.lineTo(size.width, size.height.percentage(85));
    path.lineTo(size.width, 0);
    path.lineTo(size.width.percentage(15), 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
