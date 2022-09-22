// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:get/get.dart';

class KitController extends GetxController {
  List<WooCom> wooComponents = [];
  Kit? product;

  void updateProduct(Kit product) {
    this.product = product;
    calculateTotalPrice();

    update();
  }

  void updateWooComponents(List<WooCom> components) {
    if (components.isNotEmpty) {
      wooComponents = components;
      calculateTotalPrice();

      update();
    }
  }

  void updateWooComDefaultProduct(int wooComIndex, Product product) {
    var tempProduct = wooComponents[wooComIndex].defaultProduct;
    wooComponents[wooComIndex].defaultProduct = product;
    wooComponents[wooComIndex].defaultProductId = product.id;
    wooComponents[wooComIndex]
        .products
        .removeWhere((element) => element!.id == product.id);
    wooComponents[wooComIndex].products.add(tempProduct);
    calculateTotalPrice();

    update();
  }

  void incrementDefaultProductQuantity(int wooComIndex) {
    if (wooComponents[wooComIndex].qty < wooComponents[wooComIndex].max) {
      wooComponents[wooComIndex].qty++;
      calculateTotalPrice();

      update();
    }
  }

  void decrementDefaultProductQuantity(int wooComIndex) {
    if (wooComponents[wooComIndex].qty > wooComponents[wooComIndex].min) {
      wooComponents[wooComIndex].qty--;
      calculateTotalPrice();
      update();
    }
  }

  void calculateTotalPrice() {
    var totalPrice = 0.0;
    wooComponents.forEach((product) {
      double price = double.parse(product.defaultProduct!.price);
      totalPrice += price * product.qty;
    });
    product!.totalPrice = totalPrice;
  }

  int bill = -1;
  bool showBillResult = false;
  double energyOffset = 0.5;
  int billTokWh = 0;

  void updateEneryOffset(double value) {
    energyOffset = value;
    update();
  }

  void updateBill(int bill) {
    this.bill = bill;
    // billTokWh = (bill / 2.60).round();
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
