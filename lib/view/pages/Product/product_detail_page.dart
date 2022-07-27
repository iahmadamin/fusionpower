import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/view/pages/Product/widgets/mini_product_tile.dart';
import 'package:fusionpower/view/pages/Product/widgets/product_data_tile.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryPurple,
          ),
        ),
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: labelColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Image.asset(product.imagePath)),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Product Description",
                    style: TextStyle(
                        color: greyDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.38),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.description,
                    style: const TextStyle(
                        color: Color(0xFF898A8D),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.38),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Product Data",
                        style: TextStyle(
                            color: greyDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.38),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.add,
                          size: 20,
                          color: greyDark,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ProductDataTile(product: product),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productDataBGColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Solar System",
                      style: const TextStyle(
                          color: greyDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.38),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "A high-level look at the system",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MiniProductTile(),
                        MiniProductTile(),
                        MiniProductTile(),
                      ],
                    )
                  ]),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productDataBGColor,
              ),
              child: Center(
                child: Text(
                  "You Can Have A Max Of 35 Panels This Inverter.",
                  style: const TextStyle(
                      color: greyDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.38),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productDataBGColor,
              ),
              child: Column(children: [
                Text(
                  "Also Includes Everything You Need",
                  style: const TextStyle(
                      color: greyDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.38),
                ),
                Text(
                  "Brackets, Wiring, Switches And Fuses",
                  style: const TextStyle(
                      color: greyDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.38),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: productDataBGColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Related Products",
                      style: const TextStyle(
                          color: greyDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.38),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MiniProductTile(border: false),
                        MiniProductTile(border: false),
                        MiniProductTile(border: false),
                      ],
                    )
                  ]),
            ),
            const SizedBox(height: 32),
          ]),
        ),
      ),
    );
  }
}
