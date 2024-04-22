import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XSize {
  XSize._(); // restrict unwanted instance creation

// Padding and margin sizes
  static const double paddingXs = 4.0;
  static const double paddingS = 8.0;
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;
  static const double paddingXl = 32.0;

// Icon sizes
  static const double iconXs = 12.0;
  static const double iconS = 16.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXl = 28.0;

  // Font sizes
  static const double fontSizeXs = 12.0;
  static const double fontSizeS = 14.0;
  static const double fontSizeM = 16.0;
  static const double fontSizeL = 18.0;
  static const double fontSizeXl = 20.0;

  // Default spacing between sections
  static const double defaultSpace = 20.0;
  static const double spaceBtwItems = 10.0;
  static const double spaceBtwSections = 20.0;

  // App Bar height
  static const double appBarHeigth = kToolbarHeight;

  // Bottom Navigation  Bar height
  static const double bottomNavigationBarHeight = kBottomNavigationBarHeight;

  // Status Bar height
  static double statusBarHeigth = MediaQuery.of(Get.context!).padding.top;

  // Bottom Bar height
  static double bottomBarHeigth = MediaQuery.of(Get.context!).padding.bottom;
}
