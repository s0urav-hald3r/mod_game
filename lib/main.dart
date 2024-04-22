import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mod_game/app.dart';
import 'package:mod_game/utils/constants/storage_constants.dart';

Future<void> main() async {
// ! Add Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

// ! Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// ! Init Local Storage
  await GetStorage.init(XStorageConstant.softStorage);
  await GetStorage.init(XStorageConstant.hardStorage);

// ! Fixed Portrait Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

// Todo: Initialize Firebase
// Todo: Initialize Authentication

  runApp(const App());

// ! Remove Native Splash
  FlutterNativeSplash.remove();
}
