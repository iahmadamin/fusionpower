import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/view/pages/Kit/widgets/bill_widget.dart';
import 'package:fusionpower/view/pages/Kit/widgets/installation_add_on.dart';
import 'package:fusionpower/view/pages/Kit/widgets/installation_process.dart';
import 'package:fusionpower/view/pages/Kit/widgets/kit_price.dart';
import 'package:fusionpower/view/pages/Kit/widgets/quote_sticky_bottom.dart';
import 'package:fusionpower/view/pages/Kit/widgets/register_your_system.dart';
import 'package:fusionpower/view/pages/Kit/widgets/your_solar_system.dart';
import 'package:get/get.dart';

class KitDetail extends StatelessWidget {
  KitDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  int firstSolar = 1;
  int secondSolar = 2;
  int thirdSolar = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
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
          "Kit Details",
          style: TextStyle(
            color: labelColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Center(
                            child: Image.network(product.images.isEmpty
                                ? 'https://fusionpower.co.za/wp-content/uploads/2021/06/SA-LSK-Per-1024x1024-1.jpeg'
                                : product.images[0]["src"]))),
                    const SizedBox(
                      height: 18,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 26),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       const Text(
                    //         "Product Description",
                    //         style: TextStyle(
                    //             color: greyDark,
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w600,
                    //             letterSpacing: 0.38),
                    //       ),
                    //       const SizedBox(
                    //         height: 6,
                    //       ),
                    //       Text(
                    //         product.description,
                    //         style: const TextStyle(
                    //             color: Color(0xFF898A8D),
                    //             fontSize: 12,
                    //             fontWeight: FontWeight.w500,
                    //             letterSpacing: 0.38),
                    //       ),
                    //       const SizedBox(
                    //         height: 18,
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           const Text(
                    //             "Product Data",
                    //             style: TextStyle(
                    //                 color: greyDark,
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w600,
                    //                 letterSpacing: 0.38),
                    //           ),
                    //           GestureDetector(
                    //             onTap: () {},
                    //             child: const Icon(
                    //               Icons.add,
                    //               size: 20,
                    //               color: greyDark,
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 12),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                            color: greyDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.38),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Bundle Test Product",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.38,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const KitPriceWidget(),
                    BillWidget(),
                    const YourSolarSystemWidget(),

                    const InstalltionProcessWidget(),
                    // Container(
                    //   margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 14, vertical: 18),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(12),
                    //     color: productDataBGColor,
                    //   ),
                    //   child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text(
                    //           "Related Products",
                    //           style: TextStyle(
                    //               color: greyDark,
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.w700,
                    //               letterSpacing: 0.38),
                    //         ),
                    //         const SizedBox(
                    //           height: 12,
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //           children: const [
                    //             MiniProductTile(border: false),
                    //             MiniProductTile(border: false),
                    //             MiniProductTile(border: false),
                    //           ],
                    //         )
                    //       ]),
                    // ),

                    // const SizedBox(height: 16),

                    InstallationAddonWidget(product: product),
                    const SizedBox(height: 4),
                    const RegisterYourSystemwidget(),
                    const SizedBox(height: 180),
                  ]),
            ),
            QuoteStickyBottomWidget(product: product),
          ],
        ),
      ),
    );
  }
}
