// To parse this JSON data, do
//
//     final wooCom = wooComFromJson(jsonString);

// WooCom wooComFromJson(String str) => WooCom.fromJson(json.decode(str));

// String wooComToJson(WooCom data) => json.encode(data.toJson());

import 'product_model.dart';

class WooCom {
  WooCom({
    required this.name,
    required this.type,
    required this.categories,
    required this.defaultProductId,
    required this.productIds,
    required this.optional,
    required this.qty,
    required this.min,
    required this.max,
    this.defaultProduct,
    required this.products,
  });

  WooCom copyWith({
    String? name,
    String? type,
    String? categories,
    int? defaultProductId,
    String? productIds,
    String? optional,
    int? qty,
    int? min,
    int? max,
    Product? defaultProduct,
    List<Product>? products,
  }) =>
      WooCom(
        name: name ?? this.name,
        type: type ?? this.type,
        categories: categories ?? this.categories,
        defaultProductId: defaultProductId ?? this.defaultProductId,
        productIds: productIds ?? this.productIds,
        optional: optional ?? this.optional,
        qty: qty ?? this.qty,
        min: min ?? this.min,
        max: max ?? this.max,
        defaultProduct: defaultProduct ?? this.defaultProduct,
        products: products ?? this.products,
      );

  String name;
  String type;
  String categories;
  int defaultProductId;
  String optional;
  int min, max, qty;
  String productIds;
  List<Product?> products;
  Product? defaultProduct;

  // factory WooCom.fromJson(Map<String, dynamic> json) => WooCom(
  //       name: json["name"],
  //       desc: json["desc"],
  //       type: json["type"],
  //       orderby: json["orderby"],
  //       order: json["order"],
  //       other: json["other"],
  //       tags: json["tags"],
  //       categories: json["categories"],
  //       products: json["products"],
  //       exclude: json["exclude"],
  //       wooComDefault: json["default"],
  //       optional: json["optional"],
  //       price: json['price'] == "" ? 0.0 : double.parse(json["price"]),
  //       qty: int.parse(json["qty"]),
  //       min: int.parse(json["min"]),
  //       max: int.parse(json["max"]),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "type": type,
  //       "categories": categories,
  //       "products": products,
  //       "default": wooComDefault,
  //       "optional": optional,
  //       "qty": qty,
  //       "min": min,
  //       "max": max,
  //     };

  @override
  String toString() {
    return "WooCom(name: $name, defaultId: $defaultProductId, productIds: $productIds, qty: $qty, min: $min, max: $max)\n";
  }
}
