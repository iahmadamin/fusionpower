enum KitType {
  solarPower,
  loadShedding,
}

class Product {
  final String imagePath, description, title;
  final int price;
  final KitType kitType;
  final List<String> availbleInAreas;
  final List<String> contractors;

  Product(
      {required this.imagePath,
      required this.description,
      required this.title,
      required this.contractors,
      required this.availbleInAreas,
      required this.kitType,
      required this.price});
}
