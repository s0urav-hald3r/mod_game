import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart' hide Response;
import 'package:mod_game/common/models/mod.dart';
import 'package:mod_game/utils/constants/endpoints.dart';
import 'package:mod_game/utils/logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../services/dio_client.dart';

class GameDetailsRepo extends GetxController {
  static GameDetailsRepo get instance => Get.find();
  final DioClient _dioClient = DioClient();

  final ReceivePort _receivePort = ReceivePort();

  final Rx<Mod> mod = Mod().obs;

  @override
  void onReady() {
    super.onReady();
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, 'downloader_send_port');

    _receivePort.listen((dynamic data) {
      if (data[1] == 3) updateDownloadCount({'id': mod.value.id});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? sendPort =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    sendPort?.send([id, status, progress]);
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
    await _dioClient.post(XEndpoint.updateDownloadCount, body: body);
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
              true // click on notification to open downloaded file (for Android)
          );
    }
  }

  //  ---------------------------------* Function End *--------------------------------
}
