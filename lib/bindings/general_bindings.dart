import 'package:get/get.dart';
import 'package:mod_game/common/controllers/navigation_bar_controller.dart';
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/data/repositorys/game_details_repo.dart';
import 'package:mod_game/data/repositorys/home_repo.dart';
import 'package:mod_game/feature/community/controllers/community_controller.dart';
import 'package:mod_game/feature/download/controller/download_controller.dart';
import 'package:mod_game/feature/game_details/controllers/game_details_controller.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/controllers/page_view_controller.dart';
import 'package:mod_game/feature/search/controllers/search_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // To check network connectivity
    Get.lazyPut(() => NetworkController());

    // To change screen via bottom navigation bar
    Get.lazyPut(() => NavigationBarController());

    // Home page controllers
    Get.lazyPut(() => PageViewController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeRepo());

    // Search page controllers
    Get.lazyPut(() => SearchController());

    // Community page controllers
    Get.lazyPut(() => CommunityController());

    // Download page controllers
    Get.lazyPut(() => DownloadController());

    // Game details page controllers
    Get.lazyPut(() => GameDetailsController());
    Get.lazyPut(() => GameDetailsRepo());
  }
}
