import 'dart:convert';

import 'package:get/get.dart' hide Response;
import 'package:dio/dio.dart';
import 'package:mod_game/common/models/mod_response.dart';
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/feature/home/models/category.dart';
import 'package:mod_game/feature/home/models/category_response.dart';
import 'package:mod_game/utils/constants/endpoints.dart';

import '../services/dio_client.dart';

class HomeRepo extends GetxController {
  static HomeRepo get instance => Get.find();
  final DioClient _dioClient = DioClient();

  //  ---------------------------------* Function Start *------------------------------

  // Get mods
  Future<List<Mod>> getMods(dynamic body) async {
    Response response = await _dioClient.post(XEndpoint.getMods, body: body);

    ModResponse modResponse = ModResponse.fromJson(json.decode(response.data));

    return modResponse.data.isEmpty ? [] : modResponse.data;
  }

  // Get categories
  Future<List<Category>> getCategories() async {
    Response response = await _dioClient.get(XEndpoint.getCategories);

    CategoryResponse categoryResponse =
        CategoryResponse.fromJson(json.decode(response.data));

    return categoryResponse.data.isEmpty ? [] : categoryResponse.data;
  }

  //  ---------------------------------* Function End *--------------------------------
}
