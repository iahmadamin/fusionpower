import 'woo_com_model.dart';

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
  double totalPrice;

  Kit({
    this.totalPrice = 0.0,
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
