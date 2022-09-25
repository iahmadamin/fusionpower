// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:developer';

import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:get/get.dart';

import 'helpers.dart';

class KitController extends GetxController {
  List<WooCom> wooComponents = [];
  Kit? kit;

  void updateKit(Kit kit) {
    this.kit = kit;
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

  /// wooComIndex is list of [0,1,2]
  /// 0 = panel
  /// 1 = inverter
  /// 2 = battery
  /// product is replaced by defaultProduct in wooComponents
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

  void setDefaultProductQuantity(int wooComIndex, int quantity) {
    wooComponents[wooComIndex].qty = quantity;
    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    var totalPrice = 0.0;
    wooComponents.forEach((product) {
      double price = double.parse(product.defaultProduct!.price);
      totalPrice += price * product.qty;
    });
    kit!.totalPrice = totalPrice;
  }

  double bill = -1;
  bool showBillResult = false;
  double energyOffset = 0.8;
  int billTokWh = 0;
  bool validBillAmount = false;

  void updateValidBillAmount(bool val) {
    if (validBillAmount != val) {
      validBillAmount = val;
      update();
    }
  }

  void updateEneryOffset(double value) {
    energyOffset = value;
    update();
  }

  void updateBill(double b) {
    if (b == bill) return;
    bill = b;
    billTokWh = (bill / 2.60).round();

    try {
      int batteryQty = wooComponents[2].qty;
      int minBatteryQty = wooComponents[2].min;
      double batterySize =
          (wooComponents[2].defaultProduct! as Battery).storageSize;
      double sliderValue = energyOffset * 100;
      int billToKwh = billTokWh;
      int panelWatts = (wooComponents[0].defaultProduct! as Panel).watts;

      log("Battery Qty: $batteryQty");
      log("Battery Size: $batterySize");
      log("SliderValue: $sliderValue");
      log("Bill To kWh: $billToKwh");
      log("Panel Watts: $panelWatts");

      final defaultInverter = wooComponents[1].defaultProduct!;
      final inverters = wooComponents[1].products;

      final allInverters = [defaultInverter, ...inverters];
      final totalWatts = panelWatts * wooComponents[0].qty;

      final inverterData = calculateInverterSize(
          inverters: allInverters, totalWatts: totalWatts);

      log("Inverter Id: ${inverterData['id']}");
      log("Inverters Qty: ${inverterData['qty']}");

      if (inverterData['id'] != wooComponents[1].defaultProduct!.id) {
        final inverterToSetDefault = wooComponents[1]
            .products
            .firstWhere((element) => element!.id == inverterData['id']);
        updateWooComDefaultProduct(1, inverterToSetDefault!);
      }

      var batteries = calculateNumberOfBatteries(
          minBatteryQty: minBatteryQty,
          sliderValue: sliderValue,
          billToKwh: billToKwh,
          batterySize: batterySize);

      log("Batteries: $batteries");
      var panels = calculateNumberOfPannels(
        batteryQty: batteryQty,
        batterySize: batterySize,
        sliderValue: sliderValue,
        billToKwh: billTokWh,
        panelWatts: panelWatts,
      );
      log("Panels: $panels");

      setDefaultProductQuantity(0, panels);
      setDefaultProductQuantity(1, inverterData['qty']);
      setDefaultProductQuantity(2, batteries);
    } catch (e) {
      log("Exception in KitController updateBill (calculateNumberOfPannels): $e");
    }

    update();
  }

  void enableShowBillResult() {
    if (!showBillResult) {
      showBillResult = true;
      update();
    }
  }

  void disableShowBillResult() {
    if (showBillResult) {
      showBillResult = false;
      update();
    }
  }
}
