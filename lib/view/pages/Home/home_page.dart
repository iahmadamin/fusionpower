// ignore_for_file: unused_local_variable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/controllers/serach_controller.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Kit/kit_detail_page.dart';
import 'package:fusionpower/view/pages/Kit/kit_page.dart';
import 'package:fusionpower/view/pages/Product/product_listing_page.dart';
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
    final solarPowerKitCategories = [
      {
        "title": "All Solar Kits",
        "imgPath": "assets/icons/icons8-solar-cell-64 (1).png",
      },
      {
        "title": "Hybrid",
        "imgPath": "assets/icons/icons8-solar-cell-64 (3).png",
      },
      {
        "title": "Off-Grid",
        "imgPath": "assets/icons/icons8-solar-panel-48.png",
      },
    ];
    final loadSheddingKitCategories = [
      {
        "title": "All Load Shedding Kits",
        "imgPath": "assets/icons/icons8-energy-window-50.png",
      },
      {
        "title": "Portable Power Kits",
        "imgPath": "assets/icons/icons8-electricity-50.png",
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

    final bannerImages = [
      "assets/images/banner.png",
      "assets/images/banner1.png"
    ];

    return Scaffold(
        //backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: greyDark,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Fusion Power",
            style: TextStyle(fontFamily: 'Purple Purse'),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white,
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => KitPage(
                                          kitCategory: e['title'].toString(),
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => KitPage(
                                          kitCategory: e['title'].toString(),
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => ProductListingPage(
                                          products: inverters,
                                          productCategory: "Inverters",
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => ProductListingPage(
                                          products: inverters,
                                          productCategory: "Solar Batteries",
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => ProductListingPage(
                                          products: inverters,
                                          productCategory: "Solar Panels",
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
                                  label: e['title'].toString(),
                                  imgPath: e['imgPath']!,
                                  onTap: () {
                                    Get.to(() => ProductListingPage(
                                          products: inverters,
                                          productCategory: "Heating & Cooling",
                                        ));
                                  }))
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
          color: Colors.white,
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
              Get.to(() => KitDetail(product: productList[0]));
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
