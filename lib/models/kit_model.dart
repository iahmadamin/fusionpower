import 'package:fusionpower/models/woo_com_model.dart';

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

  // factory Kit.fromJson(Map<String, dynamic> json) {
  //   return Kit(
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
