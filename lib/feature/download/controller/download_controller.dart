import 'dart:io';

import 'package:get/get.dart' hide FormData;
import 'package:mod_game/common/models/mod.dart';

class DownloadController extends GetxController {
  static DownloadController get instance => Get.find();

  @override
  void onReady() {
    super.onReady();
    getFilesFromDownloadFolder();
  }

  Directory? _getDownloadDirectory() {
    try {
      return Directory('/storage/emulated/0/Download');
    } catch (e) {
      return null;
    }
  }

  void getFilesFromDownloadFolder() async {
    // Get the downloads directory using path_provider
    Directory? downloadsDirectory = _getDownloadDirectory();
    if (downloadsDirectory != null) {
      // List all files in the downloads directory
      List<FileSystemEntity> files = downloadsDirectory.listSync();
      for (FileSystemEntity file in files) {
        // Do something with each file
        String filePath = file.path;
        String fileName =
            filePath.split('/').last.split('.').first.split('(').first.trim();
        if (downloadedMods.indexWhere((element) => element.title == fileName) ==
            -1) {
          downloadedModFiles.add(fileName);
        }
      }
    }
  }

  //  ---------------------------------* Variable Start *------------------------------

  final RxList<String> _downloadedModFiles = <String>[].obs;
  final RxList<Mod> _downloadedMods = <Mod>[].obs;

  //  ---------------------------------* Variable End *--------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Getter Start *--------------------------------

  List<String> get downloadedModFiles => _downloadedModFiles;
  List<Mod> get downloadedMods => _downloadedMods;

  //  ---------------------------------* Getter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Setter Start *--------------------------------

  set downloadedModFiles(mod) => _downloadedModFiles.value = mod;
  set downloadedMods(modName) => _downloadedModFiles.value = modName;

  //  ---------------------------------* Setter End *----------------------------------

  //  ---------------------------------------------------------------------------------

  //  ---------------------------------* Function Start *------------------------------

  addNewDownloadedMod(Mod mod) {
    if (!downloadedModFiles.contains(mod.title)) {
      downloadedMods.add(mod);
    }
  }

  // Function to determine the downloaded mods
  void filterDownloadedMods(List<Mod> mods) {
    for (var mod in mods) {
      if (downloadedModFiles.contains(mod.title)) {
        downloadedMods.add(mod);
      }
    }
  }

  //  ---------------------------------* Function End *--------------------------------
}
