import 'package:fusionpower/services/api_services.dart';
import 'package:get/get.dart';
import 'dart:convert';

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
    print("Status Code: ${response.status.code}");
    if (!response.status.hasError && response.bodyString != null) {
      products.value = productModelFromJson(response.bodyString!);
      //   products.add(ProductModel.fromJson(json.decode(response.bodyString!)));
      print(products);
      print(products.length);
    }
    loading(false);
  }
}

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

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
  final List<dynamic> categories, tags, metaData, images;
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
    required this.metaData,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      stockStatus: json["stock_status"],
      name: json["name"],
      permalink: json["permalink"],
      description: json["description"],
      shortDescription: json["short_description"],
      price: json["price"],
      regularPrice: json["regular_price"],
      salePrice: json["sale_price"],
      onSale: json["on_sale"],
      weight: json["weight"],
      id: json["id"],
      categories: json["categories"],
      tags: json["tags"],
      images: json["images"],
      metaData: json["meta_data"],
    );
  }

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
        "meta_data": metaData,
      };

  @override
  String toString() {
    return "\n Categories: $categories";
  }
}
