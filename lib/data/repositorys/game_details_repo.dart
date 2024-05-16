import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart' hide Response, FormData;
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/common/widgets/snackbar.dart';
import 'package:mod_game/feature/download/controller/download_controller.dart';
import 'package:mod_game/utils/constants/endpoints.dart';
import 'package:mod_game/utils/logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/dio_client.dart';

class GameDetailsRepo extends GetxController {
  static GameDetailsRepo get instance => Get.find();
  final DioClient _dioClient = DioClient();

  late ReceivePort receivePort;
  Timer? _debounceTimer;

  final Rx<Mod> mod = Mod().obs;

  final controller = DownloadController.instance;

  @override
  void onInit() {
    super.onInit();

    // Initializee receive port
    receivePort = ReceivePort();
  }

  @override
  void onReady() {
    super.onReady();

    // Register the send port with a unique name
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, 'downloader_send_port');

    // Listen for data from the isolate
    receivePort.listen((dynamic data) {
      if (data == 3) {
        // Cancel the previous timer if it is still active
        _debounceTimer?.cancel();

        // Start a new timer
        _debounceTimer = Timer(const Duration(seconds: 1), () {
          updateDownloadCount(FormData.fromMap({'id': mod.value.id}));
        });
        return;
      }

      if (data == 4) {
        XSnackBar.show('Failed', '${mod.value.title} downloaded failed.', 2);
        return;
      }

      if (data == 5) {
        XSnackBar.show(
            'Canceled', '${mod.value.title} downloaded canceled.', 2);
        return;
      }
    });

    // Register the callback for FlutterDownloader
    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    // Remove the port name mapping when disposing
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _debounceTimer?.cancel();
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? sendPort =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    if (sendPort != null) {
      sendPort.send(status);
    }
  }

  // Get the external storage path
  Future<Directory?> _getExternalDirectory() async {
    Directory? dir;
    try {
      if (Platform.isIOS) {
        dir = await getApplicationDocumentsDirectory(); // for iOS
      } else {
        dir = await getExternalStorageDirectory(); // for Android
      }
    } catch (err) {
      Logger.e(err);
    }
    return dir;
  }

  // Request for storage permission
  Future<bool> _requestStoragePermission() async {
    var permissionStatus = await Permission.storage.status;
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await Permission.storage.request();
    }
    return permissionStatus == PermissionStatus.granted;
  }

  //  ---------------------------------* Function Start *------------------------------

  Future<void> updateDownloadCount(dynamic body) async {
    Response response =
        await _dioClient.post(XEndpoint.updateDownloadCount, body: body);
    var jsondata = json.decode(response.data);
    if (jsondata['success']) {
      XSnackBar.show(
          'Successful', '${mod.value.title} downloaded successfully.', 0);
      controller.addNewDownloadedMod(mod.value);
    }
  }

  Future<void> downloadMod() async {
    final externalPath = await _getExternalDirectory();
    final isPermissionStatusGranted = await _requestStoragePermission();
    if (isPermissionStatusGranted) {
      await FlutterDownloader.enqueue(
        url: mod.value.file!,
        savedDir: externalPath!.path,
        fileName: mod.value.title,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true, // save the mod in the downloads directory
      );
    }
  }

  //  ---------------------------------* Function End *--------------------------------
}
