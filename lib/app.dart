import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mod_game/bindings/general_bindings.dart';
import 'package:mod_game/feature/home/views/home.dart';
import 'package:mod_game/utils/helper/navigation.dart';
import 'package:get/get.dart';

import 'utils/constants/colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primaryColor: XColor.primaryColor,
            scaffoldBackgroundColor: XColor.scaffoldDarkBackgroundColor,
          ),
          initialBinding: GeneralBindings(),
          navigatorKey: Navigation.navigatorKey,
          home: const Home(),
        );
      },
    );
  }
}
