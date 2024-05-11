import 'package:get/get.dart';
import 'package:mod_game/common/controllers/navigation_bar_controller.dart';
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/data/repositorys/home_repo.dart';
import 'package:mod_game/feature/home/controllers/home_controller.dart';
import 'package:mod_game/feature/home/controllers/page_view_controller.dart';
import 'package:mod_game/feature/search/controllers/search_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => NavigationBarController());
    Get.lazyPut(() => PageViewController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HomeRepo());
    Get.lazyPut(() => SearchController());
  }
}
