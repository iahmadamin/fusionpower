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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Center(child: Image.asset(product.imagePath))),
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
                    const Text(
                      "Your Solar System",
                      style: TextStyle(
                          color: greyDark,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.38),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
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
                      children: const [
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
              child: const Center(
                child: Text(
                  "You Can Have A Max Of 35 Panels This Inverter.",
                  style: TextStyle(
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
              child: Column(children: const [
                Text(
                  "Also Includes Everything You Need",
                  style: TextStyle(
                      color: greyDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.38),
                ),
                Text(
                  "Brackets, Wiring, Switches And Fuses",
                  style: TextStyle(
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
                    const Text(
                      "Related Products",
                      style: TextStyle(
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
                      children: const [
                        MiniProductTile(border: false),
                        MiniProductTile(border: false),
                        MiniProductTile(border: false),
                      ],
                    )
                  ]),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Solar System",
                    style: TextStyle(
                        color: greyDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.38),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "A high-level look at the system",
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Areas Available:",
                    style: TextStyle(
                        color: greyDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.38),
                  ),
                  const SizedBox(height: 6),
                  for (var location in product.availbleInAreas)
                    _AreaTile(location: location),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Installation Contractor:",
                    style: TextStyle(
                        color: greyDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.38),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "Qualified Electrician Solar Installer",
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  const SizedBox(height: 6),
                  for (var title in product.contractors)
                    _ContractorTile(title: title),
                  const SizedBox(height: 16),
                  Text(
                    "R ${product.price}",
                    style: const TextStyle(
                        color: greyDark,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.38),
                  ),
                  const Text(
                    "Inc VAT",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 26,
                        width: 98,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF434343))),
                        child: const Center(
                          child: Text(
                            "Add Option",
                            style: TextStyle(
                              color: Color(0xFF434343),
                              fontSize: 10,
                              letterSpacing: 0.38,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ]),
        ),
      ),
    );
  }
}

class _AreaTile extends StatelessWidget {
  const _AreaTile({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(children: [
        const Icon(
          Icons.location_on,
          size: 14,
          color: greenCrayola,
        ),
        const SizedBox(width: 10),
        Text(
          location,
          style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF898A8D)),
        )
      ]),
    );
  }
}

class _ContractorTile extends StatelessWidget {
  const _ContractorTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Row(children: [
        const Icon(
          Icons.blur_circular,
          size: 14,
          color: greenCrayola,
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xFF898A8D)),
        )
      ]),
    );
  }
}
