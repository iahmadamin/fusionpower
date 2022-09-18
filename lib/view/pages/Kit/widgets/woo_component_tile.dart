import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:get/get.dart';

class WooComponentTile extends StatefulWidget {
  const WooComponentTile({
    Key? key,
    required this.wooCom,
    this.border = true,
    // required this.title,
    // required this.subtitle,
    // required this.imagePath,
    // required this.count,
    // required this.onIncrement,
    // required this.onDecrement,
    // required this.index,
    // this.showChangeButton = false,
  }) : super(key: key);

  final WooCom wooCom;
  final bool border;

  @override
  State<WooComponentTile> createState() => _WooComponentTileState();
}

class _WooComponentTileState extends State<WooComponentTile> {
  // bool showChangeButton;
  final ApiController apiController = Get.find();

  final KitController kitController = Get.find();

  late final Product defaultProduct;
  late final WooCom wooCom;

  @override
  void initState() {
    super.initState();
    defaultProduct = widget.wooCom.defaultProduct!;
    wooCom = widget.wooCom;
  }

  @override
  Widget build(BuildContext context) {
    log("Image Url: ${defaultProduct.images[0]["src"]}");
    return Container(
      height: 230,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: widget.border
            ? Border.all(
                color: const Color(0xFFC7C7CC),
              )
            : null,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: 80,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(defaultProduct.images[0]["src"]),
              Positioned(
                  right: 0,
                  top: 22,
                  child: Container(
                    height: 26,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryBlue,
                    ),
                    child: Center(
                        child: Text(
                      "x${wooCom.qty}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          ),
        ),
        if (wooCom.productIds.isNotEmpty)
          GestureDetector(
            onTap: () {
              // productChangeSheet(context, index);
            },
            child: Container(
              width: 74,
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black,
              ),
              child: const Center(
                  child: Text(
                "Change",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        if (wooCom.productIds.isEmpty)
          const SizedBox(
            height: 24,
          ),
        Text(
          wooCom.name,
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          defaultProduct.name,
          textAlign: TextAlign.center,
          maxLines: 3,
          style: const TextStyle(
            fontSize: 8,
            overflow: TextOverflow.ellipsis,
            color: Color(0xFF898A8D),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(6)),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.black,
                )),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(6)),
                child: const Center(
                    child: Icon(
                  Icons.remove,
                  size: 18,
                  color: Colors.black,
                )),
              ),
            ),
          ],
        )
      ]),
    );
  }

  // Future<T?> productChangeSheet<T>(
  //   BuildContext context,
  //   final int index,
  // ) async {
  //   return Get.bottomSheet(Container(
  //     height: Get.height * 0.5,
  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
  //     color: Colors.white,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const SizedBox(
  //                 width: 12,
  //               ),
  //               const Text(
  //                 "Change Selection",
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               GestureDetector(
  //                 onTap: () {
  //                   Get.back();
  //                 },
  //                 child: const Icon(Icons.close, color: Colors.grey),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 18),

  //           for (var i = 0; i < wooComponents.length; i++)
  //             Padding(
  //               padding: const EdgeInsets.only(bottom: 12),
  //               child: ProductSelectionTile(
  //                 component: wooComponents[i],
  //                 index: index,
  //               ),
  //             ),
  //           // const SizedBox(height: 12),
  //           // const ProductSelectionTile(
  //           //   imgPath: "assets/images/BYD-HVM-BMS-1-300x300.jpg",
  //           //   price: 3425.05,
  //           //   title: "BYD-HVM-BMS-1",
  //           // ),
  //           // const SizedBox(height: 12),
  //           // const ProductSelectionTile(
  //           //   imgPath: "assets/images/Luxpower-OGV2-300x300.jpg",
  //           //   price: 2944.05,
  //           //   title: "Luxpower OGV2",
  //           // ),
  //         ],
  //       ),
  //     ),
  //   ));

  // }

}
