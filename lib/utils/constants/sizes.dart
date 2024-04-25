import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XSize {
  XSize._(); // restrict unwanted instance creation

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

  // Bottom Navigation Bar height
  static double customBottomBarHeigth = 70;
}
