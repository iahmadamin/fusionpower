// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:developer';

import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:fusionpower/services/api_services.dart';
import 'package:get/get.dart';

class KitController extends GetxController {
  List<Map<String, dynamic>> products = [
    {
      'imgPath': "assets/images/solar.png",
      'title': "150 kWH",
      'subtitle': "Monthle Prod.",
      'count': 1,
    },
    {
      'imgPath': "assets/images/Deye2-Hybrid-inverter-8kw-300x300.jpg",
      'title': "12 kW",
      'subtitle': "Max Power",
      'count': 1,
    },
    {
      'imgPath': "assets/images/Fusion_battery-300x300.jpg",
      'title': "4.8 kWH",
      'subtitle': "Storage",
      'count': 1,
    },
  ];

  final ProductProvier _provider = ProductProvier();

  List<WooCom> _wooCompoents = [];
  ProductModel? _product;

  List<WooCom> get wooComComponents => _wooCompoents;
  ProductModel? get product => _product;
  List<WooCom> _selectedWooComponents = [];
  List<WooCom> _unselectedWooComponents = [];
  List<WooCom> get selectedWooComponents => _selectedWooComponents;
  List<WooCom> get unselectedWooComponents => _unselectedWooComponents;

  void updateSelectedWooComponents(int index, WooCom wooCom) {
    int prevIndex = _unselectedWooComponents.indexOf(wooCom);
    _unselectedWooComponents[prevIndex] = selectedWooComponents[index];
    _selectedWooComponents[index] = wooCom;
    update();
  }

  void updateProduct(ProductModel product) {
    _product = product;
    update();
  }

  void updateWooComponents(List<WooCom> wooCompoents) {
    if (wooComComponents.isNotEmpty) {
      _wooCompoents = wooCompoents;
      _selectedWooComponents = _wooCompoents.sublist(0, 3);

      // for (var element in _selectedWooComponents) {
      //   log("Default ProductId: ${element.defaultProductId}, ProductIds: ${element.productIds}");
      // }

      _unselectedWooComponents = _wooCompoents.sublist(3);
      update();
    }
  }

  int totalProductCounts = 3;

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

  void incrementProductCount(int index) {
    if (products[index]['count'] < 35) {
      products[index]['count'] = products[index]['count'] + 1;
      totalProductCounts++;
      update();
    }
  }

  void decrementProductCount(int index) {
    if (products[index]['count'] > 1) {
      products[index]['count'] = products[index]['count'] - 1;
      totalProductCounts--;
      update();
    }
  }

  void updateProductModel() {
    log("Update Product Model started");
    try {
      List<WooCom> wooComs = [];
      List<Product>? products = [];
      _product!.wooComComponents.forEach((wooCom) async {
        final Product defaultProduct =
            await getProduct(wooCom.defaultProductId);
        if (wooCom.productIds.isNotEmpty) {
          final ids =
              wooCom.productIds.split(",").map((e) => int.parse(e)).toList();
          products = ids
              .map((id) async => await getProduct(id))
              .cast<Product>()
              .toList();
        }
        wooComs.add(wooCom.copyWith(
            defaultProduct: defaultProduct, products: products ?? []));
      });

      _product = _product!.copyWith(wooComComponents: wooComs);
      update();
      log("Successfully updated product model");
    } catch (e) {
      log("Exception in updateProductModel KitController: $e");
    }
  }

  Future<Product> getProduct(int id) async {
    Product? product;

    try {
      var response = await _provider.getProductById(id);
      log("Status Code: ${response.status.code}");
      if (!response.status.hasError && response.bodyString != null) {
        final productJson =
            jsonDecode(response.bodyString!) as Map<String, dynamic>;
        product = Product(
          id: productJson["id"],
          name: productJson["name"],
          sku: productJson["sku"],
          price: productJson["price"],
          regularPrice: productJson["regular_price"],
          salePrice: productJson["sale_price"],
          weight: productJson["weight"],
          dimensions: productJson["dimensions"],
          images: productJson["images"],
        );
      }
    } catch (e) {
      log("Exception in getProduct (ApiController): $e");
    }

    return product!;
  }
}
