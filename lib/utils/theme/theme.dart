import 'package:flutter/material.dart';
import 'package:mod_game/utils/constants/colors.dart';
import 'package:mod_game/utils/theme/custom_themes/appbar_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/chip_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/divider_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/drawer_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/icon_button_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/icon_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/radio_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/text_button_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/text_theme.dart';
import 'package:mod_game/utils/theme/custom_themes/textfield_theme.dart';

class XTheme {
  XTheme._();

  ///-- Light Theme Settings
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: XColor.primaryColor,
    scaffoldBackgroundColor: XColor.scaffoldLigthBackgroundColor,
    appBarTheme: XAppbarTheme.lightAppBarTheme,
    textTheme: XTextTheme.lightTextTheme,
    elevatedButtonTheme: XElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: XOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: XTextButtonTheme.lightTextButtonTheme,
    checkboxTheme: XCheckboxTheme.lightCheckboxTheme,
    inputDecorationTheme: XTextFieldTheme.lightInputDecorationTheme,
    dividerTheme: XDividerTheme.lightDividerTheme,
    drawerTheme: XDrawerTheme.lightDrawerTheme,
    iconTheme: XIconTheme.lightIconTheme,
    iconButtonTheme: XIconButtonTheme.lightIconButtonTheme,
    radioTheme: XRadioTheme.lightRadioTheme,
    chipTheme: XChipTheme.lightChipTheme,
  );

  ///-- Dark Theme Settings
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: XColor.primaryColor,
    scaffoldBackgroundColor: XColor.scaffoldDarkBackgroundColor,
    appBarTheme: XAppbarTheme.darkAppBarTheme,
    textTheme: XTextTheme.darkTextTheme,
    elevatedButtonTheme: XElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: XOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: XTextButtonTheme.darkTextButtonTheme,
    checkboxTheme: XCheckboxTheme.darkCheckboxTheme,
    inputDecorationTheme: XTextFieldTheme.darkInputDecorationTheme,
    dividerTheme: XDividerTheme.darkDividerTheme,
    drawerTheme: XDrawerTheme.darkDrawerTheme,
    iconTheme: XIconTheme.darkIconTheme,
    iconButtonTheme: XIconButtonTheme.darkIconButtonTheme,
    radioTheme: XRadioTheme.darkRadioTheme,
    chipTheme: XChipTheme.darkChipTheme,
  );
}
