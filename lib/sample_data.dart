import 'package:fusionpower/models/product_model.dart';

const areas = ["Gauteng", "Cape Town", "George", "Polokwane", "Port Elizabeth"];
const contractors = [
  "The installation of the Kit only",
  "A COC electrician certificate",
  "Workmanship Guarantee",
  "Booking Management",
  "Covers basic fault support",
];
const additionalInfo = {
  'Weight': 34.5,
  'Dimensions': '422 x 702 x 281 cm',
  'Brand': 'Deye',
  'kw-size': '12kW',
  'volt-size': '180V~600V',
  'phase': '3 Phase',
  'system-type': 'Hybrid',
  'warranty': '1 year',
  'product-type': 'Inverter',
  'best-for': 'Home',
  'Colors': 'Black, Purple, White',
};

List<Product> productList = [
  Product(
      imagePath: "assets/images/kit1.jpeg",
      kitType: KitType.solarPower,
      description:
          "Electrolux presents Jade Inverter air conditioner with high EER, Heavy compressor, Turbo cooling and many unique features.",
      title: "Hybrid Solar Power Kit",
      availbleInAreas: [
        "Gauteng",
        "Cape Town",
        "George",
        "Polokwane",
        "Port Elizabeth"
      ],
      contractors: [
        "The installation of the Kit only",
        "A COC electrician certificate",
        "Workmanship Guarantee",
        "Booking Management",
        "Covers basic fault support",
      ],
      price: 1900),
];

List<Product> inverters = [
  Product(
    imagePath: "assets/images/Deye2-Hybrid-inverter-5kw-300x300.jpg",
    description: "description",
    title: "Hybrid Inverter",
    availbleInAreas: areas,
    contractors: contractors,
    kitType: KitType.product,
    price: 1343,
    additionalInfo: additionalInfo,
  ),
  Product(
      imagePath: "assets/images/Fus-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Fusion Hybrid Inverter",
      availbleInAreas: areas,
      contractors: contractors,
      kitType: KitType.product,
      additionalInfo: additionalInfo,
      price: 1343),
  Product(
      imagePath: "assets/images/Deye2-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Hybrid Inverter",
      availbleInAreas: areas,
      contractors: contractors,
      kitType: KitType.product,
      additionalInfo: additionalInfo,
      price: 1343),
  Product(
      imagePath: "assets/images/Fus-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Fusion Hybrid Inverter",
      availbleInAreas: areas,
      contractors: contractors,
      kitType: KitType.product,
      additionalInfo: additionalInfo,
      price: 5324),
];
