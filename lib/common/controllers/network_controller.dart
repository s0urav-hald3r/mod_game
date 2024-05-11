import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../utils/logger/logger.dart';

class NetworkController extends GetxController {
  static NetworkController get instance => Get.find();

  // Manages the network connectivity status and provides methods to check and handle connectivity changes.
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

// Initialize the network manager and set up a stream to continually check the connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
  }

  // Check the internet connection status.
  // returns true if connected, false otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();

      if (_connectionStatus.value == ConnectivityResult.none) {
        // XSnackBar.show('Warning', 'No Internet Connection', 'warning');
      }

      if (result == ConnectivityResult.none) return false;

      if (result == ConnectivityResult.mobile) return true;
      if (result == ConnectivityResult.wifi) return true;

      return false;
    } on PlatformException catch (e) {
      Logger.e(e);
      return false;
    }
  }

// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
