import 'woo_com_model.dart';

enum KitType {
  solar,
  loadShedding,
}

extension KitTypeTitle on KitType {
  String get title {
    switch (this) {
      case KitType.solar:
        return "Solar Pannel Kit";
      case KitType.loadShedding:
        return "Load Shedding Kit";
    }
  }
}

class Kit {
  final String name;
  final int id;
  final List<dynamic> images;
  final List<WooCom> wooComComponents;
  final KitType kitType;
  double totalPrice;
  double pricePerMonth;

  Kit({
    this.totalPrice = 0.0,
    this.pricePerMonth = 0.0,
    required this.kitType,
    required this.name,
    required this.id,
    required this.images,
    required this.wooComComponents,
  });
}
