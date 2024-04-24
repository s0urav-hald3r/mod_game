import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  static SearchController get instance => Get.find();

  //Variables
  final search = TextEditingController();
}
