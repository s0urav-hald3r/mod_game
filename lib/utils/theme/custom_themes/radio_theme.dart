import 'package:flutter/material.dart';
import 'package:mod_game/utils/constants/colors.dart';

/// Custom Class for Light & Dark Radio Themes

class XRadioTheme {
  XRadioTheme._(); // To avoid creating instances

  /// Customizable Light Radio Theme
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.primaryColor;
      } else {
        return XColor.darkerGrey;
      }
    }),
    visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  /// Customizable Dark Radio Theme
  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return XColor.primaryColor;
      } else {
        return XColor.darkerGrey;
      }
    }),
    visualDensity: const VisualDensity(
        horizontal: VisualDensity.minimumDensity,
        vertical: VisualDensity.minimumDensity),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
