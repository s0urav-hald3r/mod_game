import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/data/repositorys/home_repo.dart';
import 'package:mod_game/feature/download/controller/download_controller.dart';
import 'package:mod_game/feature/home/models/category.dart';
import 'package:mod_game/utils/constants/app_constants.dart';
import 'package:mod_game/utils/constants/enums.dart';
import 'package:mod_game/utils/constants/storage_constants.dart';
import 'package:mod_game/utils/local_storage/local_storage.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final downloadController = DownloadController.instance;

  @override
  void onReady() {
    super.onReady();
    _retrieveFavMods();
  }

  // Function to retrieve favorite mods from local storage
  Future<void> _retrieveFavMods() async {
    final String storeData =
        XLocalStorage.getData(XStorageConstant.favMods, KeyType.STR);
    if (storeData.isNotEmpty) {
      // Split the storeData string by commas to get individual JSON strings
      final List<String> jsonStrings = storeData.split('|');

      // Create a list to store decoded Mod objects
      List<Mod> decodedMods = [];

      // Decode each JSON string and add the corresponding Mod object to the list
      for (String jsonString in jsonStrings) {
        Mod mod = Mod.fromJson(json.decode(jsonString));
        decodedMods.add(mod);
      }

      // Update favMods with the decoded Mod objects
      favMods = decodedMods;
    }
  }

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<Mod> _mostTrendingMods = <Mod>[].obs;
  final RxList<Mod> _categoryMods = <Mod>[].obs;
  final RxList<Mod> _recommendedMods = <Mod>[].obs;

  final RxList<Mod> _favMods = <Mod>[].obs;

  final RxList<Category> _categories = <Category>[].obs;

  final RxBool _isTrendingLoading = false.obs;
  final RxBool _isGetCategoryLoading = false.obs;
  final RxBool _isPostCategoryLoading = false.obs;
  final RxBool _isRecommendedLoading = false.obs;

  final Rx<String> _selectedModType = ''.obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<Mod> get mostTrendingMods => _mostTrendingMods;
  List<Mod> get categoryMods => _categoryMods;
  List<Mod> get recommendedMods => _recommendedMods;

  List<Mod> get favMods => _favMods;
  List<Category> get categories => _categories;

  bool get isTrendingLoading => _isTrendingLoading.value;
  bool get isGetCategoryLoading => _isGetCategoryLoading.value;
  bool get isPostCategoryLoading => _isPostCategoryLoading.value;
  bool get isRecommendedLoading => _isRecommendedLoading.value;

  String get selectedModType => _selectedModType.value;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set mostTrendingMods(mods) => _mostTrendingMods.value = mods;
  set categoryMods(mods) => _categoryMods.value = mods;
  set recommendedMods(mods) => _recommendedMods.value = mods;

  set favMods(mods) => _favMods.value = mods;
  set categories(categories) => _categories.value = categories;

  set isTrendingLoading(loading) => _isTrendingLoading.value = loading;
  set isGetCategoryLoading(loading) => _isGetCategoryLoading.value = loading;
  set isPostCategoryLoading(loading) => _isPostCategoryLoading.value = loading;
  set isRecommendedLoading(loading) => _isRecommendedLoading.value = loading;

  set selectedModType(modType) => _selectedModType.value = modType;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  // Function to update favorite mods in local storage
  Future<void> _updateFavMods() async {
    // Encode each Mod object to JSON string
    List<String> jsonModStrings =
        favMods.map((mod) => json.encode(mod.toJson())).toList();

    // Join JSON strings with comma to form a single string
    String joinedJson = jsonModStrings.join('|');

    // Save the joined JSON string to local storage
    await XLocalStorage.addData(XStorageConstant.favMods, joinedJson);
  }

  // Function to toggle a mod as favorite
  void toggleFavorite(Mod mod) {
    int index = favMods.indexWhere((e) => e.id == mod.id);
    if (index != -1) {
      favMods.removeWhere((e) => e.id == mod.id);
    } else {
      favMods.add(mod);
    }
    _updateFavMods();
  }

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
        .getMods(FormData.fromMap({'category': XAppConstant.trending}));

    downloadController.filterDownloadedMods(mostTrendingMods);

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
        .getMods(FormData.fromMap({'category': XAppConstant.recommended}));

    downloadController.filterDownloadedMods(recommendedMods);

    // Stop Loader
    isRecommendedLoading = false;
  }

  // Fetch category wise mods
  Future<void> getCategoryMods() async {
    // Start Loader
    isPostCategoryLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isPostCategoryLoading = false;
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // API call
    categoryMods = await HomeRepo.instance
        .getMods(FormData.fromMap({'category': selectedModType}));

    downloadController.filterDownloadedMods(categoryMods);

    // Stop Loader
    isPostCategoryLoading = false;
  }

  // Fetch category wise mods
  Future<void> getCategories() async {
    // Start Loader
    isGetCategoryLoading = true;

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      isGetCategoryLoading = false;
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // API call
    categories = await HomeRepo.instance.getCategories();

    selectedModType = categories.first.name!;

    // Stop Loader
    isGetCategoryLoading = false;
  }

  //  ---------------------------------* Function End *--------------------------------
}
