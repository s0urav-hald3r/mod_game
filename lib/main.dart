import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mod_game/app.dart';

Future<void> main() async {
// ! Add Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

// ! Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// ! Init Local Storage
  await GetStorage.init();

// ! Fixed Portrait Orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

// ! Plugin must be initialized before using Flutter Downloader
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );

// Todo: Initialize Firebase
// Todo: Initialize Authentication

  runApp(const App());

// ! Remove Native Splash
  FlutterNativeSplash.remove();
}
