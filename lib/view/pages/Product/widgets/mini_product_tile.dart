import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/pages/Product/widgets/product_selection_tile.dart';
import 'package:get/get.dart';

class MiniProductTile extends StatelessWidget {
  MiniProductTile({
    Key? key,
    this.border = true,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
    this.showChangeButton = false,
  }) : super(key: key);

  final bool border;
  bool showChangeButton;
  final String title, subtitle, imagePath;
  final int count;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: border
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
              Image.asset(imagePath),
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
                      "x${count}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          ),
        ),
        if (showChangeButton)
          GestureDetector(
            onTap: () {
              productChangeSheet(context);
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
        if (!showChangeButton)
          const SizedBox(
            height: 24,
          ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 9,
            letterSpacing: 0.35,
            fontWeight: FontWeight.w500,
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
              onTap: onIncrement,
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
              onTap: onDecrement,
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

  Future<T?> productChangeSheet<T>(BuildContext context) async {
    return Get.bottomSheet(Container(
      height: Get.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 12,
              ),
              const Text(
                "Change Selection",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ProductSelectionTile(
            imgPath: "assets/images/Genki-300W-300x300.jpg",
            price: 5234.05,
            title: "Genki 300W",
          ),
          const SizedBox(height: 12),
          const ProductSelectionTile(
            imgPath: "assets/images/BYD-HVM-BMS-1-300x300.jpg",
            price: 3425.05,
            title: "BYD-HVM-BMS-1",
          ),
          const SizedBox(height: 12),
          const ProductSelectionTile(
            imgPath: "assets/images/Luxpower-OGV2-300x300.jpg",
            price: 2944.05,
            title: "Luxpower OGV2",
          ),
        ],
      ),
    ));
  }
}
