import 'dart:convert';
import 'dart:developer';

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
    await getProducts();
  }

  getProducts() async {
    updateLoading(true);

    var productsResponse = await _provider.getProducts();
    log("Status Code: ${productsResponse.status.code}");
    if (!productsResponse.status.hasError &&
        productsResponse.bodyString != null) {
      // kits.value = productModelFromJson(response.bodyString!);

      var productsJson = jsonDecode(productsResponse.bodyString!);
      log("Length: ${productsJson.length}, type: ${productsJson.runtimeType}");

      // productsJson.forEach((product)
      for (var productJson in productsJson) {
        final wooComComponents =
            await extractWooComFromMetaData(productJson["meta_data"]);
        final Kit product = Kit(
          stockStatus: productJson["stock_status"],
          name: productJson["name"],
          permalink: productJson["permalink"],
          description: productJson["description"],
          shortDescription: productJson["short_description"],
          price: productJson["price"],
          regularPrice: productJson["regular_price"],
          salePrice: productJson["sale_price"],
          onSale: productJson["on_sale"],
          weight: productJson["weight"],
          id: productJson["id"],
          categories: extractCategoreis(productJson["categories"]),
          tags: productJson["tags"],
          images: productJson["images"],
          wooComComponents: wooComComponents,
        );
        log("Product: $product");
        kits.add(product);
      }
    }
    updateLoading(false);
  }

  // Future<Product> getProduct(int id) async {
  //   loading(true);
  //   Product? product;

  //   try {
  //     var response = await _provider.getProducts();
  //     log("Status Code: ${response.status.code}");
  //     if (!response.status.hasError && response.bodyString != null) {
  //       final productJson =
  //           jsonDecode(response.bodyString!) as Map<String, dynamic>;
  //       product = Product(
  //         id: productJson["id"],
  //         name: productJson["name"],
  //         sku: productJson["sku"],
  //         price: productJson["price"],
  //         regularPrice: productJson["regular_price"],
  //         salePrice: productJson["sale_price"],
  //         weight: productJson["weight"],
  //         dimensions: productJson["dimensions"],
  //         images: productJson["images"],
  //       );
  //     }
  //   } catch (e) {
  //     log("Exception in getProduct (ApiController): $e");
  //   }

  //   loading(false);
  //   return product!;
  // }

  // List<Kit> productModelFromJson(String str) =>
  //     List<Kit>.from(json.decode(str).map((x) {
  //       return Kit(
  //         stockStatus: x["stock_status"],
  //         name: x["name"],
  //         permalink: x["permalink"],
  //         description: x["description"],
  //         shortDescription: x["short_description"],
  //         price: x["price"],
  //         regularPrice: x["regular_price"],
  //         salePrice: x["sale_price"],
  //         onSale: x["on_sale"],
  //         weight: x["weight"],
  //         id: x["id"],
  //         categories: extractCategoreis(x["categories"]),
  //         tags: x["tags"],
  //         images: x["images"],
  //         wooComComponents: extractWooComFromMetaData(x["meta_data"]),
  //       );
  //     }));

  List<String> extractCategoreis(mapedCategories) {
    final List<String> categories = [];
    for (var i = 0; i < mapedCategories.length; i++) {
      categories.add(mapedCategories[i]['name']);
    }
    return categories;
  }

  Future<List<WooCom>> extractWooComFromMetaData(metadata) async {
    final List<WooCom> wooComs = [];
    for (var i = 0; i < metadata.length; i++) {
      if (metadata[i]['key'] == 'wooco_components') {
        // wooCom.addAll(metadata[i]['value']);
        final wooComComponents = metadata[i]['value'];
        if (wooComComponents.length >= 3) {
          for (var j = 0; j < 3; j++) {
            final wooComJson = wooComComponents[j];
            Product? defaultProduct =
                await getProduct(int.parse(wooComJson['default']));

            // final productIds = wooComJson["kits"]
            //     .split(",")
            //     .map((e) => int.parse(e))
            //     .toList();

            // log("Product Ids: $productIds");

            // final List<Product> kits =
            //     await Future.wait(productIds.map((id) => getProduct(id)));

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
                products: []);

            wooComs.add(wooCom);
          }
        }

        return wooComs;
      }
    }
    return wooComs;
  }

  Future<Product?> getProduct(int id) async {
    late final Product product;
    try {
      final productJson = await _provider.getProductById(id);

      log("Product Status Code: ${productJson.status.code}");
      if (!productJson.status.hasError && productJson.bodyString != null) {
        product = Product.fromJson(jsonDecode(productJson.bodyString!));
        log("Default Product: $product");
        return product;
      }
    } catch (e) {
      log("Exception in getProduct api controller: $e");
    }

    return null;
  }

  // Future<List<WooCom>> extractWooComFromMetaData(metadata) async {
  //   final List<WooCom> wooComs = [];

  //   for (var i = 0; i < metadata.length; i++) {
  //     if (metadata[i]['key'] == 'wooco_components') {
  //       // wooCom.addAll(metadata[i]['value']);
  //       final wooComComponents = metadata[i]['value'];
  //       for (var j = 0; j < wooComComponents.length; j++) {
  //         final wooComJson = wooComComponents[j];

  //         // final defaultProduct =
  //         //     await getProduct(int.parse(wooComJson["default"]));
  //         // final productIds = wooComJson["kits"]
  //         //     .split(",")
  //         //     .map((e) => int.parse(e))
  //         //     .toList();

  //         // final List<Product> kits =
  //         //     await Future.wait(productIds.map((id) => getProduct(id)));

  //         final wooCom = WooCom(
  //           name: wooComJson["name"],
  //           type: wooComJson["type"],
  //           categories: wooComJson["categories"],
  //           productIds: wooComJson["kits"],
  //           defaultProductId: int.parse(wooComJson["default"]),
  //           optional: wooComJson["optional"],
  //           qty: int.parse(wooComJson["qty"]),
  //           min: int.parse(wooComJson["min"]),
  //           max: int.parse(wooComJson["max"]),
  //         );

  //         wooComs.add(wooCom);
  //       }
  //       return wooComs;
  //     }
  //   }
  //   return wooComs;
  // }

  void updateLoading(val) {
    if (loading != val) {
      loading = val;
      update();
    }
  }
}

class Kit {
  final String stockStatus,
      name,
      permalink,
      description,
      shortDescription,
      price,
      regularPrice,
      salePrice,
      weight;
  final int id;
  final List<dynamic> tags, images;
  final List<String> categories;
  final List<WooCom> wooComComponents;
  final bool onSale;

  Kit({
    required this.stockStatus,
    required this.name,
    required this.permalink,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.weight,
    required this.id,
    required this.categories,
    required this.tags,
    required this.images,
    required this.onSale,
    required this.wooComComponents,
  });

  Kit copyWith({
    String? stockStatus,
    String? name,
    String? permalink,
    String? description,
    String? shortDescription,
    String? price,
    String? regularPrice,
    String? salePrice,
    String? weight,
    int? id,
    List<dynamic>? tags,
    List<dynamic>? images,
    List<String>? categories,
    List<WooCom>? wooComComponents,
    bool? onSale,
  }) =>
      Kit(
        stockStatus: stockStatus ?? this.stockStatus,
        name: name ?? this.name,
        permalink: permalink ?? this.permalink,
        description: description ?? this.description,
        shortDescription: shortDescription ?? this.shortDescription,
        price: price ?? this.price,
        regularPrice: regularPrice ?? this.regularPrice,
        salePrice: salePrice ?? this.salePrice,
        weight: weight ?? this.weight,
        id: id ?? this.id,
        tags: tags ?? this.tags,
        images: images ?? this.images,
        categories: categories ?? this.categories,
        wooComComponents: wooComComponents ?? this.wooComComponents,
        onSale: onSale ?? this.onSale,
      );

  @override
  String toString() {
    return "Product Id: $id";
  }
}
