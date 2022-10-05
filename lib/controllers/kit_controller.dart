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
  late List<WooCom> defaultProducts;

  double bill = -1;
  bool showBillResult = false;
  double energyOffset = 0.8;
  int billTokWh = 0;
  bool validBillAmount = false;
  bool registrationAddonSelected = false;
  bool installationAddonSelected = false;
  double registrationAddonCost = 5000 * 1.15;
  double installationAddonCost = 0.0;

  final Map<String, double> installerRates = {
    'base': 7275.0,
    'panel': 575.0,
    'inverter': 2500.0,
  };

  calculateInstallationAddonCost() {
    installationAddonCost =
        (wooComponents[0].qty * 575) + (wooComponents[1].qty * 2500) + 7275;
  }

  void toggleInstallationAddon() {
    if (installationAddonSelected) {
      installationAddonSelected = false;
      kit!.totalPrice -= installationAddonCost;
      kit!.pricePerMonth = pmt(kit!.totalPrice);
    } else {
      installationAddonSelected = true;
      kit!.totalPrice += installationAddonCost;
      kit!.pricePerMonth = pmt(kit!.totalPrice);
    }
    update();
  }

  void toggleRegistrationAddon() {
    if (registrationAddonSelected) {
      registrationAddonSelected = false;
      kit!.totalPrice -= registrationAddonCost;
      kit!.pricePerMonth = pmt(kit!.totalPrice);
    } else {
      registrationAddonSelected = true;
      kit!.totalPrice += registrationAddonCost;
      kit!.pricePerMonth = pmt(kit!.totalPrice);
    }
    update();
  }

  void updateKit(Kit kit) {
    this.kit = kit;
    calculateTotalPrice();

    update();
  }

  void setDefaultQuantities() {
    defaultProducts = kit!.wooComComponents.map((e) => e).toList();
    log("DefaultProducts: $defaultProducts");
  }

  void revertToDefaultQuantities() {
    kit!.wooComComponents.asMap().forEach((index, element) {
      element = defaultProducts[index];
    });
    installationAddonSelected = false;
    kit!.totalPrice -= installationAddonCost;
    registrationAddonSelected = false;
    kit!.totalPrice -= registrationAddonCost;
    kit!.pricePerMonth = pmt(kit!.totalPrice);

    calculateInstallationAddonCost();

    calculateTotalPrice();
    update();
  }

  void updateWooComponents(List<WooCom> components) {
    if (components.isNotEmpty) {
      wooComponents = components;
      calculateInstallationAddonCost();

      calculateTotalPrice();
      setDefaultQuantities();
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

    if (wooComIndex == 1) {
      final inverterData = calculateInverterSize(
          inverters: [product],
          totalWatts: (wooComponents[0].defaultProduct! as Panel).watts *
              wooComponents[0].qty);
      setDefaultProductQuantity(1, inverterData['qty']);
    } else if (wooComIndex == 2) {
      var batteries = billTokWh == 0
          ? 1
          : calculateNumberOfBatteries(
              minBatteryQty: defaultProducts[2].min,
              sliderValue: energyOffset * 100,
              billToKwh: billTokWh,
              batterySize:
                  (defaultProducts[2].defaultProduct! as Battery).storageSize,
            );
      setDefaultProductQuantity(2, batteries);
    }

    calculateInstallationAddonCost();
    calculateTotalPrice();
    update();
  }

  void incrementDefaultProductQuantity(int wooComIndex) {
    if (wooComponents[wooComIndex].qty < wooComponents[wooComIndex].max) {
      wooComponents[wooComIndex].qty++;

      calculateInstallationAddonCost();
      calculateTotalPrice();

      update();
    }
  }

  void decrementDefaultProductQuantity(int wooComIndex) {
    if (wooComponents[wooComIndex].qty > wooComponents[wooComIndex].min) {
      wooComponents[wooComIndex].qty--;
      calculateInstallationAddonCost();

      calculateTotalPrice();
      update();
    }
  }

  void setDefaultProductQuantity(int wooComIndex, int quantity) {
    wooComponents[wooComIndex].qty = quantity;
    calculateInstallationAddonCost();

    calculateTotalPrice();
    update();
  }

  void calculateTotalPrice() {
    var totalPrice = 0.0;
    wooComponents.forEach((wooCom) {
      double price = double.parse(wooCom.defaultProduct!.price);
      totalPrice += price * wooCom.qty;
    });

    kit!.totalPrice = totalPrice * 1.15;
    kit!.pricePerMonth = pmt(totalPrice);
  }

  void updateValidBillAmount(bool val) {
    if (validBillAmount != val) {
      validBillAmount = val;
      update();
    }
  }

  void updateEneryOffset(double value) {
    energyOffset = value;
    calculateNumberOfItems(
      sliderValue: energyOffset * 100,
      bQty: defaultProducts[2].qty,
      minBQty: defaultProducts[2].min,
      bStorageSize: (defaultProducts[2].defaultProduct! as Battery).storageSize,
    );
    update();
  }

  void updateBill(double b) {
    if (b == bill) return;
    bill = b;
    billTokWh = (bill / 2.60).round();
    calculateNumberOfItems(
      sliderValue: energyOffset * 100,
    );
    update();
  }

  void calculateNumberOfItems({
    required double sliderValue,
    int? bQty,
    int? minBQty,
    double? bStorageSize,
  }) {
    try {
      int batteryQty = bQty ?? wooComponents[2].qty;
      int minBatteryQty = minBQty ?? wooComponents[2].min;
      double batterySize = bStorageSize ??
          (wooComponents[2].defaultProduct! as Battery).storageSize;
      int panelWatts = (wooComponents[0].defaultProduct! as Panel).watts;

      final defaultInverter = wooComponents[1].defaultProduct!;
      final inverters = wooComponents[1].products;

      final allInverters = [defaultInverter, ...inverters];

      var panels = calculateNumberOfPannels(
        batteryQty: batteryQty,
        batterySize: batterySize,
        sliderValue: sliderValue,
        billToKwh: billTokWh,
        panelWatts: panelWatts,
      );
      // log("New Panel Qt: $panels");

      var batteries = calculateNumberOfBatteries(
          minBatteryQty: minBatteryQty,
          sliderValue: sliderValue,
          billToKwh: billTokWh,
          batterySize: batterySize);

      // log("New Battery Qty: $batteries");

      final totalWatts = panelWatts * panels;

      final inverterData = calculateInverterSize(
          inverters: allInverters, totalWatts: totalWatts);

      // log("Inverter Id: ${inverterData['id']}");
      // log("Inverters Qty: ${inverterData['qty']}");

      if (inverterData['id'] != wooComponents[1].defaultProduct!.id) {
        final inverterToSetDefault = wooComponents[1]
            .products
            .firstWhere((element) => element!.id == inverterData['id']);
        updateWooComDefaultProduct(1, inverterToSetDefault!);
      }

      setDefaultProductQuantity(0, panels);
      setDefaultProductQuantity(1, inverterData['qty']);
      setDefaultProductQuantity(2, batteries);
    } catch (e) {
      log("Exception in KitController updateBill (calculateNumberOfPannels): $e");
    }
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
