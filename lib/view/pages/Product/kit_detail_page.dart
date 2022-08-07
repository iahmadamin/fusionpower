import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/view/pages/Product/widgets/bill_widget.dart';
import 'package:fusionpower/view/pages/Product/widgets/installation_add_on.dart';
import 'package:fusionpower/view/pages/Product/widgets/your_solar_system.dart';
import 'package:fusionpower/view/pages/Product/your_details_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class KitDetail extends StatelessWidget {
  KitDetail({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
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
                        child: Center(child: Image.asset(product.imagePath))),
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
                        product.title,
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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                "R19,000",
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: greyDark,
                                ),
                              ),
                              Text(
                                "Inc VAT",
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF898A8D),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 32,
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
                                "R19,000",
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF009D90),
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
                          ),
                          const Spacer(),
                          CButton(
                            fontColor: primaryBlue,
                            color: primaryBlue.withOpacity(0.1),
                            label: "Apply Today",
                            onTap: () {},
                            height: 28,
                            width: 86,
                            filled: true,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ),
                    BillWidget(),
                    const YourSolarSystemWidget(),

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
                    const SizedBox(height: 180),
                  ]),
            ),
            Positioned(
                bottom: 0,
                child: GetBuilder<KitController>(builder: (controller) {
                  final price = product.price * controller.totalProductCounts;
                  return Container(
                    height: 140,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              spreadRadius: 8),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Per Month",
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 0.38,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "R${(price / 60).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 0.38,
                                      fontWeight: FontWeight.w600,
                                      color: primaryBlue,
                                    ),
                                  ),
                                  const Text(
                                    "over 5/yrs",
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 0.38,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF898A8D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Total Price",
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 0.38,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "R${price}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      letterSpacing: 0.38,
                                      fontWeight: FontWeight.w600,
                                      color: greyDark,
                                    ),
                                  ),
                                  const Text(
                                    "inc VAT",
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 0.38,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF898A8D),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: CButton(
                              label: "Create Quote",
                              color: primaryBlue,
                              onTap: () {
                                Get.to(() => YourDetailsPage());
                              }),
                        )
                      ],
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
