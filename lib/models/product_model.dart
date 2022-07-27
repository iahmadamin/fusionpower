enum KitType {
  solarPower,
  loadShedding,
}

class Product {
  final String imagePath, description, title;
  final int price;
  final KitType kitType;

  Product(
      {required this.imagePath,
      required this.description,
      required this.title,
      required this.kitType,
      required this.price});
}
