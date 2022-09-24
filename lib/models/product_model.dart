// class Product {
//   final int id;
//   final String name, sku, price, regularPrice, salePrice, weight;
//   Map<String, dynamic>? dimensions, attributes;
//   final List<dynamic> images;

//   Product({
//     required this.id,
//     required this.name,
//     required this.sku,
//     required this.price,
//     required this.regularPrice,
//     required this.salePrice,
//     required this.weight,
//     required this.dimensions,
//     required this.images,
//     this.attributes,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['name'],
//       sku: json['sku'],
//       price: json['price'],
//       regularPrice: json['regular_price'],
//       salePrice: json['sale_price'],
//       weight: json['weight'],
//       dimensions: json['dimensions'],
//       images: json['images'],
//     );
//   }

//   @override
//   String toString() {
//     return "Product: $name, $id, $price";
//   }
// }

enum ProductType { panel, inverter, battery }

extension ProductTypeExtension on ProductType {
  String get name {
    switch (this) {
      case ProductType.panel:
        return "panel";
      case ProductType.inverter:
        return "inverter";
      case ProductType.battery:
        return "battery";
    }
  }

  ProductType? type(String name) {
    switch (name) {
      case 'Panels':
        return ProductType.panel;
      case 'Inverter':
        return ProductType.inverter;
      case 'Battery':
        return ProductType.battery;
      default:
        return null;
    }
  }
}

abstract class Product {
  final int id;
  final String name, sku, price, regularPrice, salePrice;
  Map<String, dynamic>? dimensions;
  final List<dynamic> images;

  Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dimensions,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}

class PorductLS extends Product {
  PorductLS({
    required super.id,
    required super.name,
    required super.sku,
    required super.price,
    required super.regularPrice,
    required super.salePrice,
    required super.dimensions,
    required super.images,
  });
}

class Panel extends Product {
  final int watts;

  Panel(
      {required this.watts,
      required super.id,
      required super.name,
      required super.sku,
      required super.price,
      required super.regularPrice,
      required super.salePrice,
      required super.dimensions,
      required super.images});

  factory Panel.fromJson(Map<String, dynamic> json) {
    return Panel(
      watts: json['watts'],
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dimensions: json['dimensions'],
      images: json['images'],
    );
  }
}

class Inverter extends Product {
  final double maxPv;

  Inverter(
      {required this.maxPv,
      required super.id,
      required super.name,
      required super.sku,
      required super.price,
      required super.regularPrice,
      required super.salePrice,
      required super.dimensions,
      required super.images});

  factory Inverter.fromJson(Map<String, dynamic> json) {
    return Inverter(
      maxPv: json['max_pv'],
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dimensions: json['dimensions'],
      images: json['images'],
    );
  }
}

class Battery extends Product {
  final double storageSize;

  Battery(
      {required this.storageSize,
      required super.id,
      required super.name,
      required super.sku,
      required super.price,
      required super.regularPrice,
      required super.salePrice,
      required super.dimensions,
      required super.images});

  factory Battery.fromJson(Map<String, dynamic> json) {
    return Battery(
      storageSize: json['storage_size'],
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      dimensions: json['dimensions'],
      images: json['images'],
    );
  }
}
