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
  final String id, name, sku, price, regularPrice, salePrice, weight;
  final Map<String, dynamic> dimensions;
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
  });
}
