import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as L;
import 'package:logger/logger.dart';

class Logger {
  static var logger = L.Logger(
    filter: null,
    printer: PrettyPrinter(methodCount: 0),
    output: null,
  );

  static void d(dynamic data) {
    if (kDebugMode) logger.d(data);
  }

  static void e(dynamic data) {
    if (kDebugMode) logger.e(data);
  }

  static void i(dynamic data) {
    if (kDebugMode) logger.i(data);
  }
}
