import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/view/pages/Kit/kit_detail_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class KitPage extends StatefulWidget {
  const KitPage({Key? key, required this.kitCategory}) : super(key: key);

  final String kitCategory;
  @override
  State<KitPage> createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {
  final List<String> sortingList = [
    'Default Sorting',
    'Sorting 1',
    'Sorting 2',
  ];

  String selectedSorting = 'Default Sorting';
  late final ApiController _apiController;

  @override
  void initState() {
    super.initState();
    _apiController = Get.find();
  }

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
          widget.kitCategory,
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 32,
            //   ),
            //   child: Align(
            //     alignment: Alignment.centerLeft,
            //     child: Text(
            //       widget.kitCategory,
            //       style: const TextStyle(
            //           color: greyDark,
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           letterSpacing: 0.38),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 8),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 32,
            //   ),
            //   child: Text(
            //       widget.isSolar
            //           ? solarPowerKitDescription
            //           : loadSheddingKitDescription,
            //       style: const TextStyle(
            //           color: Color(0xFF898A8D),
            //           fontSize: 12,
            //           fontWeight: FontWeight.w500,
            //           letterSpacing: 0.38)),
            // ),

            // const SizedBox(height: 22),

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
            Obx(() {
              return _apiController.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _apiController.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = _apiController.products[index];
                        return ProductKitTile(product: product);
                      });
            }),
            // const ProductKitTile(
            //   imgPath: "assets/images/kit1.jpeg",
            // ),
            // const ProductKitTile(imgPath: "assets/images/kit1.jpeg"),
            // const ProductKitTile(imgPath: "assets/images/kit1.jpeg"),
            const SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    );
  }
}

class ProductKitTile extends StatelessWidget {
  const ProductKitTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imgUrl = product.images.isEmpty
        ? 'https://fusionpower.co.za/wp-content/uploads/2021/06/SA-LSK-Per-1024x1024-1.jpeg'
        : product.images[0]["src"];
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(imgPath),
          Image.network(imgUrl),
          const SizedBox(
            height: 18,
          ),
          Text(
            product.name, // "Hybrid Solar Power Kit",
            style: TextStyle(
                color: greyDark,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.38),
          ),
          const SizedBox(
            height: 4,
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
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Starting At",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  Text(
                    "19,000 PKR.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: greyDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pay Monthly",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  Text(
                    "19,000 PKR.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: greyDark,
                    ),
                  ),
                  Text(
                    "60 Months @ 16% APR",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 28),
          CButton(
            label: "View Solution",
            onTap: () {
              Get.to(() => KitDetail(product: product));
            },
            borderRadius: 12,
            fontSize: 12,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
