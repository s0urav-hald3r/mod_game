import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/mod.dart';
import '../../home/controllers/home_controller.dart';

class SearchController extends GetxController {
  static SearchController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    allMods = [
      ...HomeController.instance.mostTrendingMods,
      ...HomeController.instance.recommendedMods
    ];
    filterMods();
  }

  //  ---------------------------------* Variable Start *------------------------------

  final search = TextEditingController();
  final RxList<Mod> _allMods = <Mod>[].obs;
  final RxList<Mod> _filteredMods = <Mod>[].obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get allMods => _allMods;
  List<Mod> get filteredMods => _filteredMods;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set allMods(mods) => _allMods.value = mods;
  set filteredMods(mods) => _filteredMods.value = mods;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------* Function Start *------------------------------

  filterMods() {
    if (search.text.isEmpty) {
      filteredMods = allMods;
      return;
    }
    filteredMods = allMods
        .where((item) =>
            item.title!.toLowerCase().contains(search.text.toLowerCase()))
        .toList();
  }

  //  ---------------------------------* Function End *--------------------------------
}
