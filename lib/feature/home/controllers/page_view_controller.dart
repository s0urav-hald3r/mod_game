import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';

class PageViewController extends GetxController {
  static PageViewController get instance => Get.find();

  //  ---------------------------------* Variable Start *------------------------------

  final pageController = PageController();
  final RxList<Mod> _randomMods = <Mod>[].obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get randomMods => _randomMods;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  setModsForSlider() {
    var items = [
      ...HomeController.instance.mostTrendingMods,
      ...HomeController.instance.recommendedMods
    ];

    if (items.isEmpty) return;

    for (var i = 0; i < 5; i++) {
      var index = Random().nextInt(items.length);
      _randomMods.add(items[index]);
    }
  }

  //  ---------------------------------* Function End *--------------------------------
}
