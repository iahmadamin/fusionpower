import 'dart:convert';
import 'dart:developer';

import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:fusionpower/services/api_services.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  List<Kit> kits = [];
  var loading = false;

  final ProductProvier _provider = ProductProvier();

  @override
  void onInit() async {
    super.onInit();
    await getKits();
  }

  getKits() async {
    updateLoading(true);

    var kitResponse = await _provider.getKits();
    log("Kits Status Code: ${kitResponse.status.code}");
    if (!kitResponse.status.hasError && kitResponse.bodyString != null) {
      var kitsJson = jsonDecode(kitResponse.bodyString!);

      for (var kitJson in kitsJson) {
        final isCompositeKit = kitJson["type"] == "composite";
        if (!isCompositeKit) {
          continue;
        }
        final KitType kitType = extractCategory(kitJson["categories"]);
        log("Kit Type: ${kitType.toString()}");
        final int wooComLimit = kitType == KitType.solar ? 3 : 2;
        final wooComComponents =
            await extractWooComFromMetaData(kitJson["meta_data"], wooComLimit);
        final Kit kit = Kit(
          name: kitJson["name"],
          id: kitJson["id"],
          images: kitJson["images"],
          wooComComponents: wooComComponents,
          kitType: kitType,
        );
        kits.add(kit);
      }
    }
    log("ApiController getKitData completed!");
    updateLoading(false);
  }

  KitType extractCategory(mapedCategories) {
    for (var categoryJson in mapedCategories) {
      if (categoryJson["id"] == 624) {
        return KitType.loadShedding;
      } else if (categoryJson["id"] == 632) {
        return KitType.solar;
      }
    }
    return KitType.solar;
  }

  Future<List<WooCom>> extractWooComFromMetaData(metadata, int limit) async {
    final List<WooCom> wooComs = [];
    for (var i = 0; i < metadata.length; i++) {
      if (metadata[i]['key'] == 'wooco_components') {
        final wooComComponents = metadata[i]['value'];
        if (wooComComponents.length >= limit) {
          for (var j = 0; j < limit; j++) {
            final wooComJson = wooComComponents[j];
            // final productType = wooComJson['name'];
            // log("Product Type(Name): $productType");

            Product? defaultProduct =
                await getProduct(int.parse(wooComJson['default']));

            List<Product> products =
                await getProductsForEachWooComponent(wooComJson["products"]);

            final wooCom = WooCom(
              name: wooComJson["name"],
              type: wooComJson["type"],
              categories: wooComJson["categories"],
              productIds: wooComJson["products"],
              defaultProductId: int.parse(wooComJson["default"]),
              optional: wooComJson["optional"],
              qty: int.parse(wooComJson["qty"]),
              min: int.parse(wooComJson["min"]),
              max: int.parse(wooComJson["max"]),
              defaultProduct: defaultProduct,
              products: products,
            );

            wooComs.add(wooCom);
          }
        }

        return wooComs;
      }
    }
    return wooComs;
  }

  Future<List<Product>> getProductsForEachWooComponent(productIds) async {
    List<Product> products = [];

    List<String> ids = productIds.split(",").where((id) => id != "").toList();

    if (ids.isEmpty) return products;

    for (var id in ids) {
      final product = await getProduct(int.parse(id));
      products.add(product!);
    }
    return products;
  }

  Future<Product?> getProduct(int id) async {
    try {
      final kitJson = await _provider.getProductById(id);

      log("Product Status Code: ${kitJson.status.code}");
      if (!kitJson.status.hasError && kitJson.bodyString != null) {
        final productJsonDecoded =
            jsonDecode(kitJson.bodyString!) as Map<String, dynamic>;
        final productAttributes = productJsonDecoded["attributes"];
        final attributes = extractProductAttributes(productAttributes);
        final productType = attributes['product-type'];
        log("Product Type: $productType");

        if (productType == 'Solar Panel') {
          productJsonDecoded['watts'] =
              int.parse((attributes['watts']).replaceAll('W', ''));
          return Panel.fromJson(productJsonDecoded);
        } else if (productType == 'Inverter') {
          productJsonDecoded['kw_size'] =
              int.parse((attributes['kW Size']).replaceAll('kW', ''));
          productJsonDecoded['max_pv'] = double.parse(
              (attributes['maximum-pv-array-power']).replaceAll('W', ''));

          return Inverter.fromJson(productJsonDecoded);
        } else if (productType == 'Battery') {
          productJsonDecoded['storage_size'] =
              double.parse((attributes['storage-size']).replaceAll('kWh', ''));

          return Battery.fromJson(productJsonDecoded);
        }

        return null;
      }
    } catch (e) {
      log("Exception in getProduct api controller: $e");
    }
    return null;
  }

  Map<String, dynamic> extractProductAttributes(List<dynamic> attributes) {
    final Map<String, dynamic> productAttributes = {};
    for (var i = 0; i < attributes.length; i++) {
      productAttributes[attributes[i]["name"]] = attributes[i]["options"][0];
    }
    return productAttributes;
  }

  void updateLoading(val) {
    if (loading != val) {
      loading = val;
      update();
    }
  }
}
