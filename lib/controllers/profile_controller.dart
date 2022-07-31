import 'dart:io';

import 'package:fusionpower/services/system_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _systemService = SystemService();
  File? imageFile;

  void getImageFromGallery() async {
    final xfile = await _systemService.imageFromGallery();
    if (xfile != null) {
      imageFile = File(xfile.path);
      update();
    }
  }

  void getImageFromCamer() async {
    final xfile = await _systemService.imageFromCamera();
    if (xfile != null) {
      imageFile = File(xfile.path);
      update();
    }
  }
}
