// ignore_for_file: constant_identifier_names

import 'package:get_storage/get_storage.dart';

import '../constants/enums.dart';

class XLocalStorage {
  XLocalStorage._();

  static final storage = GetStorage();

  static Future<void> addData(String key, dynamic value) async {
    await storage.write(key, value);
  }

  static getData(String key, KeyType keyType) {
    switch (keyType) {
      case KeyType.BOOL:
        return storage.read(key) ?? false;
      case KeyType.INT:
        return storage.read(key) ?? 0;
      case KeyType.DOUBLE:
        return storage.read(key) ?? 0.0;
      case KeyType.STR:
        return storage.read(key) ?? '';
    }
  }

  static bool isDataAvailable(String key) {
    return storage.hasData(key);
  }

  static removeData(String key) {
    return storage.remove(key);
  }

  static Future<void> clearStorage() async {
    await storage.erase();
  }
}
