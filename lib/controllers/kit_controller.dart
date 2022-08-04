import 'package:get/get.dart';

class KitController extends GetxController {
  List<int> solars = [1, 1, 1];

  void incrementSolars(int index) {
    solars[index]++;
    update();
  }

  void decrementSolars(int index) {
    if (solars[index] > 1) {
      solars[index]--;
      update();
    }
  }
}
