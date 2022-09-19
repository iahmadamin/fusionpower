// enum KitType {
//   solarPower,
//   loadShedding,
//   product,
// }

// class Product {
//   final String imagePath, description, title;
//   final int price;
//   final KitType kitType;

//   Product(
//       {required this.imagePath,
//       required this.description,
//       required this.title,
//       required this.kitType,
//       required this.price});
// }

class Product {
  final int id;
  final String name, sku, price, regularPrice, salePrice, weight;
  Map<String, dynamic>? dimensions, attributes;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.weight,
    required this.dimensions,
    required this.images,
    this.attributes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      weight: json['weight'],
      dimensions: json['dimensions'],
      images: json['images'],
    );
  }

  @override
  String toString() {
    return "Product: $name, $id, $price";
  }
}
