import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/models/mod.dart';
import '../../home/controllers/home_controller.dart';

class CommunityController extends GetxController {
  static CommunityController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    allTrending = HomeController.instance.mostTrendingMods;
    allRecommended = HomeController.instance.recommendedMods;
    filterMods();
  }

  //  ---------------------------------* Variable Start *------------------------------

  final search = TextEditingController();
  final RxList<Mod> _allTrending = <Mod>[].obs;
  final RxList<Mod> _allRecommended = <Mod>[].obs;
  final RxList<Mod> _filteredTrending = <Mod>[].obs;
  final RxList<Mod> _filteredRecommended = <Mod>[].obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get allTrending => _allTrending;
  List<Mod> get allRecommended => _allRecommended;
  List<Mod> get filteredTrending => _filteredTrending;
  List<Mod> get filteredRecommended => _filteredRecommended;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set allTrending(mods) => _allTrending.value = mods;
  set allRecommended(mods) => _allRecommended.value = mods;
  set filteredTrending(mods) => _filteredTrending.value = mods;
  set filteredRecommended(mods) => _filteredRecommended.value = mods;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------* Function Start *------------------------------

  filterMods() {
    if (search.text.isEmpty) {
      filteredTrending = allTrending;
      filteredRecommended = allRecommended;
      return;
    }

    filteredTrending = allTrending
        .where((item) =>
            item.title!.toLowerCase().contains(search.text.toLowerCase()))
        .toList();

    filteredRecommended = allRecommended
        .where((item) =>
            item.title!.toLowerCase().contains(search.text.toLowerCase()))
        .toList();
  }

  //  ---------------------------------* Function End *--------------------------------
}
