import 'package:get/get.dart';
import 'package:mod_game/feature/home/controllers/page_view_controller.dart';
import 'package:mod_game/feature/search/controllers/search_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PageViewController());
    Get.lazyPut(() => SearchController());
  }
}
