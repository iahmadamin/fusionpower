import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/controllers/serach_controller.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Product/kit_page.dart';
import 'package:fusionpower/view/pages/Product/product_detail_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final controller = Get.put(CartController());
    final searchController = Get.put(SearchController());
    final kitController = Get.put(KitController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = productList[0];
    final solarPowerKitCategories = ["All Solar Kits", "Hybrid", "Off-Grid"];
    final loadSheddingKitCategories = [
      "All Load Shedding Kits",
      "Portable Power Kits"
    ];
    final invertersCategories = [
      "Hybrid",
      "Fusion",
      "Off-Grid",
      "Deye Hybrid Inverters",
      "LuxPowerTek",
      "Goodwe"
    ];
    final solarBatteryCategories = [
      "Lithium-ion",
      "Fusion",
      "PylonTech",
      "Dyness",
      "Shoto",
      "BYD",
      "BlueNova",
      "Portable Power Units"
    ];
    final solarPanels = [
      "Monocrystalline",
      "Polycrystallines",
      "Canadian Solar",
      "JA Solar",
      "Solar Panel Peripherals",
      "Jinko"
    ];
    final heatingCoolingCategories = [
      "Solar Powered Conversion Kits",
      "Solar Geysers",
      "Heat Pumps",
      "Energy Saving Elements",
      "Solar Air Conditioners",
    ];

    final bannerImages = [
      "assets/images/banner.png",
      "assets/images/banner1.png"
    ];

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  width: Get.width,
                  child: CarouselSlider(
                    items: bannerImages.map((image) {
                      return Container(
                        child: Image.asset(image, fit: BoxFit.contain),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      aspectRatio: 2.0,
                      initialPage: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Solar Power Kits",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: solarPowerKitCategories
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {
                              Get.to(() => KitPage(
                                    kitCategory: e,
                                  ));
                            }))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Load Shedding Kits",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    children: loadSheddingKitCategories
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {
                              Get.to(() => KitPage(
                                    kitCategory: e,
                                  ));
                            }))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Inverters",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    children: invertersCategories
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {}))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Solar Batteries",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    children: solarBatteryCategories
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {}))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Solar Panels",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    children: solarPanels
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {}))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Heating & Cooling",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                  width: Get.width,
                  child: ListView(
                    padding: const EdgeInsets.only(right: 16),
                    scrollDirection: Axis.horizontal,
                    children: heatingCoolingCategories
                        .map((e) => _SubCategoryItem(
                            label: e,
                            imgPath: "assets/images/solar.png",
                            onTap: () {}))
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ));
  }
}

class _SubCategoryItem extends StatelessWidget {
  const _SubCategoryItem({
    Key? key,
    required this.label,
    required this.imgPath,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final String imgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 100,
        margin: const EdgeInsets.only(left: 16),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 50, child: Image.asset(imgPath)),
          const SizedBox(height: 4),
          SizedBox(
              height: 45,
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ))
        ]),
      ),
    );
  }
}

class ProductMiniTile extends StatelessWidget {
  const ProductMiniTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: Get.width * 0.4,
              child: Image.asset('assets/images/p1.png')),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Hybrid Solar Power Kit",
            style: TextStyle(
                color: greyDark, fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const Text(
            "Bundle Test Product",
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w600,
              color: Color(0xFF898A8D),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Starting At",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w600,
              color: Color(0xFF898A8D),
            ),
          ),
          const Text(
            "19,000 PKR.",
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w700,
              color: greyDark,
            ),
          ),
          const SizedBox(height: 8),
          CButton(
            label: "View Solution",
            onTap: () {
              Get.to(() => ProductDetail(product: productList[0]));
            },
            borderRadius: 22,
            fontSize: 12,
            height: 36,
            width: 126,
            color: const Color(0xFF979797),
          )
        ],
      ),
    );
  }
}
