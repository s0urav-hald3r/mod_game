import 'package:get/get.dart' hide FormData;
import 'package:mod_game/common/controllers/network_controller.dart';
import 'package:mod_game/common/widgets/loader.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/data/repositorys/game_details_repo.dart';

class GameDetailsController extends GetxController {
  static GameDetailsController get instance => Get.find();

  // Download a mod
  Future<void> downloadModToStorage() async {
    // Start Loader
    XLoader.show();

    // Check internet connection
    final isConnected = await NetworkController.instance.isConnected();
    if (!isConnected) {
      XLoader.hide();
      XSnackBar.show('Error', 'No internet available', 2);
      return;
    }

    // Download mod API
    await GameDetailsRepo.instance.downloadMod();

    // Stop Loader
    XLoader.hide();
  }
}
