import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Product/product_detail_page.dart';
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
            const ProductKitTile(),
            const ProductKitTile(buttonColor: primaryPurple),
            const ProductKitTile(buttonColor: primaryPurple),
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
    this.buttonColor = Colors.black,
  }) : super(key: key);

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/p1.png'),
          const SizedBox(
            height: 18,
          ),
          const Text(
            "Hybrid Solar Power Kit",
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
              Get.to(() => ProductDetail(product: productList[0]));
            },
            borderRadius: 12,
            fontSize: 12,
            color: buttonColor,
          )
        ],
      ),
    );
  }
}
