import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/widgets/loader.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/utils/constants/app_constants.dart';
import 'package:mod_game/utils/logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawerController extends GetxController {
  static CustomDrawerController get instance => Get.find();

  //  ---------------------------------* Variable Start *------------------------------

  final email = TextEditingController(text: XAppConstant.supportMail);
  final subject = TextEditingController();
  final description = TextEditingController();

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

  //  ---------------------------------* Functin End *--------------------------------
}
