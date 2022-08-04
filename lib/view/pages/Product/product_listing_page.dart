import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/view/pages/Product/product_detail_page.dart';
import 'package:get/get.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage(
      {Key? key, required this.productCategory, required this.products})
      : super(key: key);
  final String productCategory;
  final List<Product> products;

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final List<String> sortingList = [
    'Default Sorting',
    'Sorting 1',
    'Sorting 2',
  ];

  String selectedSorting = 'Default Sorting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
        title: Text(
          widget.productCategory,
          style: const TextStyle(
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
            Container(
              height: 35,
              margin: const EdgeInsets.symmetric(horizontal: 38),
              padding: const EdgeInsets.fromLTRB(22, 0, 15, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: const Color(0xFFC7C7CC))),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(4),
                isExpanded: true,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF979797),
                ),
                underline: Container(),
                elevation: 0,
                value: selectedSorting,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 24,
                  color: Color(0xFF898A8D),
                ),
                items: sortingList.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(
                    () {
                      selectedSorting = newValue!;
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Showing all 12 Results",
              style: TextStyle(
                  color: greyDark,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.38),
            ),
            const SizedBox(height: 16),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 0.65,
              children: [
                for (final product in widget.products)
                  ProductMiniTile(
                    product: product,
                  ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class ProductMiniTile extends StatelessWidget {
  const ProductMiniTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailPage(product: product));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: const Color(0xFFC7C7CC)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: Get.width * 0.4,
                child: Center(child: Image.asset(product.imagePath))),
            const SizedBox(
              height: 12,
            ),
            Text(
              product.title,
              style: TextStyle(
                  color: greyDark, fontSize: 12, fontWeight: FontWeight.w700),
            ),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 12,
                letterSpacing: 0.38,
                fontWeight: FontWeight.w400,
                color: Color(0xFF898A8D),
              ),
            ),
            Text(
              "${product.price} PKR.",
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 0.38,
                fontWeight: FontWeight.w600,
                color: primaryBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
