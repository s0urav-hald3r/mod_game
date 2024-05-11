import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/data/repositorys/home_repo.dart';
import 'package:mod_game/utils/constants/enums.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<Mod> _mostTrendingMods = <Mod>[].obs;
  final RxBool _isLoading = false.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get mostTrendingMods => _mostTrendingMods;
  bool get isLoading => _isLoading.value;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set mostTrendingMods(List<Mod> mods) => _mostTrendingMods.value = mods;
  set isLoading(isLoading) => _isLoading.value = isLoading;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  Future<void> getMostTrendingMods() async {
    // Start Loader
    isLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isLoading = false;
      return;
    }

    // API call
    mostTrendingMods = await HomeRepo.instance
        .getMods(FormData.fromMap({'category': ModType.TRENDING.title}));

    // Stop Loader
    isLoading = false;
  }

  //  ---------------------------------* Function End *--------------------------------
}
