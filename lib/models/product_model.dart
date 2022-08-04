enum KitType {
  solarPower,
  loadShedding,
  product,
}

class Product {
  final String imagePath, description, title;
  final int price;
  final KitType kitType;
  final List<String> availbleInAreas;
  final List<String> contractors;
  final Map<String, dynamic>? additionalInfo;

  Product(
      {required this.imagePath,
      required this.description,
      required this.title,
      this.additionalInfo,
      required this.contractors,
      required this.availbleInAreas,
      required this.kitType,
      required this.price});
}
