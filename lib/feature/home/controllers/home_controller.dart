import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/data/repositorys/home_repo.dart';
import 'package:mod_game/utils/constants/enums.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<Mod> _mostTrendingMods = <Mod>[].obs;
  final RxList<Mod> _categoryMods = <Mod>[].obs;
  final RxList<Mod> _recommendedMods = <Mod>[].obs;

  final RxBool _isTrendingLoading = false.obs;
  final RxBool _isCategoryLoading = false.obs;
  final RxBool _isRecommendedLoading = false.obs;

  final Rx<ModType> _selectedModType = ModType.SLASHING.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get mostTrendingMods => _mostTrendingMods;
  List<Mod> get categoryMods => _categoryMods;
  List<Mod> get recommendedMods => _recommendedMods;

  bool get isTrendingLoading => _isTrendingLoading.value;
  bool get isCategoryLoading => _isCategoryLoading.value;
  bool get isRecommendedLoading => _isRecommendedLoading.value;

  ModType get selectedModType => _selectedModType.value;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set mostTrendingMods(mods) => _mostTrendingMods.value = mods;
  set categoryMods(mods) => _categoryMods.value = mods;
  set recommendedMods(mods) => _recommendedMods.value = mods;

  set isTrendingLoading(loading) => _isTrendingLoading.value = loading;
  set isCategoryLoading(loading) => _isCategoryLoading.value = loading;
  set isRecommendedLoading(loading) => _isRecommendedLoading.value = loading;

  set selectedModType(loading) => _selectedModType.value = loading;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  // Fetch most trending mods
  Future<void> getMostTrendingMods() async {
    // Start Loader
    isTrendingLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isTrendingLoading = false;
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // API call
    mostTrendingMods = await HomeRepo.instance
        .getMods(FormData.fromMap({'category': ModType.TRENDING.title}));

    // Stop Loader
    isTrendingLoading = false;
  }

  // Fetch recommended mods
  Future<void> getRecommendedMods() async {
    // Start Loader
    isRecommendedLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isRecommendedLoading = false;
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // API call
    recommendedMods = await HomeRepo.instance
        .getMods(FormData.fromMap({'category': ModType.RECOMMENDED.title}));

    // Stop Loader
    isRecommendedLoading = false;
  }

  // Fetch category wise mods
  Future<void> getCategoryMods(ModType modType) async {
    // Start Loader
    isCategoryLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isCategoryLoading = false;
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // API call
    categoryMods = await HomeRepo.instance
        .getMods(FormData.fromMap({'category': modType.title}));

    // Stop Loader
    isCategoryLoading = false;
  }

  //  ---------------------------------* Function End *--------------------------------
}
