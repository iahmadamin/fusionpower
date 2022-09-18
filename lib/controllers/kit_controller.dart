// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:get/get.dart';

class KitController extends GetxController {
  List<WooCom> _wooCompoents = [];
  Kit? _product;

  List<WooCom> get wooComponents => _wooCompoents;
  Kit? get product => _product;

  void updateProduct(Kit product) {
    _product = product;
    update();
  }

  void updateWooComponents(List<WooCom> components) {
    if (components.isNotEmpty) {
      _wooCompoents = components;
      update();
    }
  }

  int bill = -1;
  bool showBillResult = false;
  double energyOffset = 0.5;

  void updateEneryOffset(double value) {
    energyOffset = value;
    update();
  }

  void updateBill(int bill) {
    this.bill = bill;

    if (bill < 600) {
      showBillResult = false;
    }
    update();
  }

  void enableShowBillResult() {
    showBillResult = true;
    update();
  }
}
