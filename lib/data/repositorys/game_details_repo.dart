import 'package:get/get.dart' hide Response;
import 'package:mod_game/utils/constants/endpoints.dart';

import '../services/dio_client.dart';

class GameDetailsRepo extends GetxController {
  static GameDetailsRepo get instance => Get.find();
  final DioClient _dioClient = DioClient();

  //  ---------------------------------* Function Start *------------------------------

  Future<void> downloadMod(dynamic body) async {
    await _dioClient.post(XEndpoint.downloadMod, body: body);
  }

  //  ---------------------------------* Function End *--------------------------------
}
