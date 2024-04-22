import 'package:flutter/material.dart';

class Navigation {
  Navigation._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic>? push(dynamic route) {
    return navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  static Future<dynamic>? pushReplacement(dynamic route) {
    return navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }

  static Future<dynamic>? pushAndRemoveUntil(dynamic route) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => route),
        (route) => false);
  }

  static void pop() {
    return navigatorKey.currentState?.pop();
  }
}
