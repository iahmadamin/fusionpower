import 'dart:convert';
import 'dart:developer';

import 'package:fusionpower/models/woo_com_model.dart';
import 'package:fusionpower/services/api_services.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var products = <ProductModel>[].obs;
  var loading = false.obs;

  final ProductProvier _provider = ProductProvier();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    loading(true);
    var response = await _provider.getProducts();
    log("Status Code: ${response.status.code}");
    if (!response.status.hasError && response.bodyString != null) {
      products.value = productModelFromJson(response.bodyString!);
    }
    loading(false);
  }
}

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) {
      return ProductModel(
        stockStatus: x["stock_status"],
        name: x["name"],
        permalink: x["permalink"],
        description: x["description"],
        shortDescription: x["short_description"],
        price: x["price"],
        regularPrice: x["regular_price"],
        salePrice: x["sale_price"],
        onSale: x["on_sale"],
        weight: x["weight"],
        id: x["id"],
        categories: extractCategoreis(x["categories"]),
        tags: x["tags"],
        images: x["images"],
        wooComComponents: extractWooComFromMetaData(x["meta_data"]),
      );
    }));

List<String> extractCategoreis(mapedCategories) {
  final List<String> categories = [];
  for (var i = 0; i < mapedCategories.length; i++) {
    categories.add(mapedCategories[i]['name']);
  }
  return categories;
}

List<WooCom> extractWooComFromMetaData(metadata) {
  final List<WooCom> wooCom = [];
  for (var i = 0; i < metadata.length; i++) {
    if (metadata[i]['key'] == 'wooco_components') {
      // wooCom.addAll(metadata[i]['value']);
      final wooComComponents = metadata[i]['value'];
      for (var j = 0; j < wooComComponents.length; j++) {
        wooCom.add(WooCom.fromJson(wooComComponents[j]));
      }
      return wooCom;
    }
  }
  return wooCom;
}

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
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

  ProductModel({
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

  // factory ProductModel.fromJson(Map<String, dynamic> json) {
  //   return ProductModel(
  //     stockStatus: json["stock_status"],
  //     name: json["name"],
  //     permalink: json["permalink"],
  //     description: json["description"],
  //     shortDescription: json["short_description"],
  //     price: json["price"],
  //     regularPrice: json["regular_price"],
  //     salePrice: json["sale_price"],
  //     onSale: json["on_sale"],
  //     weight: json["weight"],
  //     id: json["id"],
  //     categories: json["categories"],
  //     tags: json["tags"],
  //     images: json["images"],
  //     metaData: json["meta_data"],

  //   );
  // }

  Map<String, dynamic> toJson() => {
        "stock_status": stockStatus,
        "name": name,
        "permalink": permalink,
        "description": description,
        "short_description": shortDescription,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "weight": weight,
        "id": id,
        "categories": categories,
        "tags": tags,
        "images": images,
      };

  @override
  String toString() {
    return "\n Categories: $categories";
  }
}
