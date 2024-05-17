import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/widgets/loader.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/utils/constants/app_constants.dart';
import 'package:mod_game/utils/constants/enums.dart';
import 'package:mod_game/utils/constants/storage_constants.dart';
import 'package:mod_game/utils/local_storage/local_storage.dart';
import 'package:mod_game/utils/logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    String storedLanguage =
        XLocalStorage.getData(XStorageConstant.language, KeyType.STR);
    if (storedLanguage.isNotEmpty) {
      switch (storedLanguage) {
        case 'ENGLISH':
          language.value = AppLanguage.ENGLISH;
          break;
        case 'HINDI':
          language.value = AppLanguage.HINDI;
          break;
      }
    }
  }

  //  ---------------------------------* Variable Start *------------------------------

  final email = TextEditingController(text: XAppConstant.supportMail);
  final subject = TextEditingController();
  final description = TextEditingController();

  final language = AppLanguage.ENGLISH.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Functin Start *--------------------------------

  void clearTextField() {
    subject.clear();
    description.clear();
  }

  Future<void> reportBug() async {
    // Start loader
    XLoader.show();

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      // Stop loader
      XLoader.hide();
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    final Uri params = Uri(
      scheme: 'mailto',
      path: XAppConstant.supportMail,
      query:
          'subject=${subject.text}&body=${description.text}', //add subject and body here
    );

    var url = params.toString();
    try {
      if (!await launchUrl(Uri.parse(url))) {
        throw 'Could not launch $url';
      }
      // Stop loader
      XLoader.hide();
    } catch (e) {
      // Stop loader
      XLoader.hide();
      Logger.e(e);
    }
  }

  Future<void> updateLanguage() async {
    Locale? locale;
    switch (language.value) {
      case AppLanguage.ENGLISH:
        locale = const Locale('en', 'US');
        Get.updateLocale(locale);
        break;
      case AppLanguage.HINDI:
        locale = const Locale('hi', 'IN');
        Get.updateLocale(locale);
        break;
    }

    // Store the selected language into the local storage
    await XLocalStorage.addData(XStorageConstant.language, language.value.name);
  }

  //  ---------------------------------* Functin End *--------------------------------
}
