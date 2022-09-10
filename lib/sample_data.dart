import 'package:fusionpower/models/product_model.dart';

const areas = [
  "Gauteng",
  "Cape Town(+ 100km Radius)",
  "George(+ 100km Radius)",
  "Polokwane(+ 50km Radius)",
  "Port Elizabeth"
];
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
      price: 1900),
];

List<Product> inverters = [
  Product(
    imagePath: "assets/images/Deye2-Hybrid-inverter-5kw-300x300.jpg",
    description: "description",
    title: "Hybrid Inverter",
    kitType: KitType.product,
    price: 1343,
  ),
  Product(
      imagePath: "assets/images/Fus-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Fusion Hybrid Inverter",
      kitType: KitType.product,
      price: 1343),
  Product(
      imagePath: "assets/images/Deye2-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Hybrid Inverter",
      kitType: KitType.product,
      price: 1343),
  Product(
      imagePath: "assets/images/Fus-Hybrid-inverter-5kw-300x300.jpg",
      description: "description",
      title: "Fusion Hybrid Inverter",
      kitType: KitType.product,
      price: 5324),
];

final solarPowerKitCategories = [
  {
    "title": "All Solar Kits",
    "imgPath": "assets/icons/icons8-solar-cell-64 (1).png",
    "url": "https://solaradvice.co.za/shop/solar-power/solar-power-kit",
  },
  {
    "title": "Hybrid",
    "imgPath": "assets/icons/icons8-solar-cell-64 (3).png",
    "url": "https://solaradvice.co.za/shop/solar-power/solar-power-kit",
  },
  {
    "title": "Off-Grid",
    "imgPath": "assets/icons/icons8-solar-panel-48.png",
    "url": "https://solaradvice.co.za/shop/solar-power/solar-power-kit",
  },
];
final loadSheddingKitCategories = [
  {
    "title": "All Load Shedding Kits",
    "imgPath": "assets/icons/icons8-energy-window-50.png",
    "url": "https://solaradvice.co.za/shop/solar-power/load-shedding-kits",
  },
  {
    "title": "Portable Power Kits",
    "imgPath": "assets/icons/icons8-electricity-50.png",
    "url": "https://solaradvice.co.za/shop/solar-power/load-shedding-kits",
  },
];

final invertersCategories = [
  {
    "title": "Hybrid",
    "imgPath": "assets/icons/icons8-heat-64.png",
  },
  {
    "title": "Fusion",
    "imgPath": "assets/icons/icons8-heating-room-50.png",
  },
  {
    "title": "Hybrid",
    "imgPath": "assets/icons/icons8-invert-colors-off-50.png",
  },
  {
    "title": "Off-Grid",
    "imgPath": "assets/icons/icons8-save-to-grid-50.png",
  },
  {
    "title": "Deye Hybrid Inverters",
    "imgPath": "assets/icons/icons8-save-to-grid-50.png",
  },
];
final solarBatteryCategories = [
  {
    "title": "BlueNova",
    "imgPath": "assets/icons/icons8-solar-64 (1).png",
  },
  {
    "title": "Dyness",
    "imgPath": "assets/icons/icons8-solar-64 (2).png",
  },
  {
    "title": "PylonTech",
    "imgPath": "assets/icons/icons8-solar-energy-64.png",
  },
  {
    "title": "Fusion",
    "imgPath": "assets/icons/icons8-solar-panel-50.png",
  },
];
final solarPanels = [
  {
    "title": "JA Solar",
    "imgPath": "assets/icons/icons8-sun-elevation-30.png",
  },
  {
    "title": "Canadian Solar",
    "imgPath": "assets/icons/icons8-sun-elevation-48.png",
  },
  {
    "title": "Polycrystallines",
    "imgPath": "assets/icons/icons8-windscreen-defrost-50.png",
  },
  {
    "title": "Monocrystalline",
    "imgPath": "assets/icons/icons8-solar-panels-30.png",
  },
];
final heatingCoolingCategories = [
  {
    "title": "Solar Air Conditioners",
    "imgPath": "assets/icons/icons8-solar-panel-26.png",
  },
  {
    "title": "Heat Pumps",
    "imgPath": "assets/icons/icons8-solar-panel-48.png",
  },
  {
    "title": "Solar Geysers",
    "imgPath": "assets/icons/icons8-solar-panels-64.png",
  },
  {
    "title": "Solar Powered Conversion Kits",
    "imgPath": "assets/icons/icons8-solar-cell-64 (3).png",
  },
];

final bannerImages = ["assets/images/banner.png", "assets/images/banner1.png"];
