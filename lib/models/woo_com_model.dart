// To parse this JSON data, do
//
//     final wooCom = wooComFromJson(jsonString);

import 'dart:convert';

WooCom wooComFromJson(String str) => WooCom.fromJson(json.decode(str));

String wooComToJson(WooCom data) => json.encode(data.toJson());

class WooCom {
  WooCom({
    required this.name,
    required this.desc,
    required this.type,
    required this.orderby,
    required this.order,
    required this.other,
    required this.tags,
    required this.categories,
    required this.products,
    required this.exclude,
    required this.wooComDefault,
    required this.optional,
    required this.price,
    required this.qty,
    required this.customQty,
    required this.min,
    required this.max,
  });

  String name;
  String desc;
  String type;
  String orderby;
  String order;
  String other;
  String tags;
  String categories;
  String products;
  String exclude;
  String wooComDefault;
  String optional;
  String price;
  String qty;
  String customQty;
  String min;
  String max;

  factory WooCom.fromJson(Map<String, dynamic> json) => WooCom(
        name: json["name"],
        desc: json["desc"],
        type: json["type"],
        orderby: json["orderby"],
        order: json["order"],
        other: json["other"],
        tags: json["tags"],
        categories: json["categories"],
        products: json["products"],
        exclude: json["exclude"],
        wooComDefault: json["default"],
        optional: json["optional"],
        price: json["price"],
        qty: json["qty"],
        customQty: json["custom_qty"],
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "type": type,
        "orderby": orderby,
        "order": order,
        "other": other,
        "tags": tags,
        "categories": categories,
        "products": products,
        "exclude": exclude,
        "default": wooComDefault,
        "optional": optional,
        "price": price,
        "qty": qty,
        "custom_qty": customQty,
        "min": min,
        "max": max,
      };

  @override
  String toString() {
    return "WooCom(name: $name, wooComDefault: $wooComDefault, optional: $optional, price: $price, qty: $qty, min: $min, max: $max)\n";
  }
}
