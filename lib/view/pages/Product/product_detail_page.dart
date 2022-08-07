import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: Center(child: Image.asset(product.imagePath))),
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
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                "Additional Information",
                style: const TextStyle(
                    color: greyDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.38),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          if (additionalInfo != null)
            Column(
              children: [
                for (final info in additionalInfo.entries)
                  _AdditionalInfoTile(
                      label: info.key, value: info.value.toString()),
              ],
            ),
          Divider(),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 12),
              child: Text(
                product.title,
                style: const TextStyle(
                    color: greyDark,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.38),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 2),
              child: Text(
                "${product.price} PKR",
                style: const TextStyle(
                    color: greyDark,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.38),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CButton(
                  label: "Add to cart",
                  onTap: () {
                    final CartController controller = Get.find();
                    controller.addProduct(product);
                    //Get.back();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("${product.title} added to the cart.")));
                    // Get.offAll(() => const RootPage(
                    //       initialIndex: 2,
                    //     ));
                  })),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }
}

class _AdditionalInfoTile extends StatelessWidget {
  const _AdditionalInfoTile({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.5))),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border.all(color: Colors.grey.withOpacity(0.5))),
              child: Text(
                value,
                style: TextStyle(
                  color: greyDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
