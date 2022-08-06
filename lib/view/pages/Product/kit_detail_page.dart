import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/view/pages/Product/widgets/mini_product_tile.dart';
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
                                  fontSize: 16,
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
                                  fontSize: 16,
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
                            height: 26,
                            width: 80,
                            filled: true,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Size your System",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.38,
                                fontWeight: FontWeight.w700,
                                color: greyDark,
                              ),
                            ),
                            const Text(
                              "Enter your Highest Montly Bill (Min R1000)",
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 0.38,
                                color: Color(0xFF898A8D),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                                height: 50,
                                width: Get.width * 0.855,
                                padding:
                                    const EdgeInsets.only(right: 8, left: 24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(0.5))),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: TextField(
                                        cursorColor: greyDark,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontSize: 16, color: greyDark),
                                        decoration: InputDecoration(
                                            hintText: "Enter Bill",
                                            hintStyle: TextStyle(
                                                color: Color(0xFFadc2d4),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic),
                                            // isDense: true,
                                            // prefixIconConstraints:
                                            //     BoxConstraints(
                                            //         minWidth: 32,
                                            //         maxHeight: 32),
                                            // contentPadding:
                                            //     EdgeInsets.only(
                                            //         left: 0, bottom: 6),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 38,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            color: const Color(0xFFadc2d4),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Update",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                letterSpacing: 0.4,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                )),
                            const SizedBox(height: 12),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: productDataBGColor,
                              ),
                              child: Column(children: const [
                                Text(
                                  "Let's Get Started",
                                  style: TextStyle(
                                      color: greyDark,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.38),
                                ),
                                Text(
                                  "Submit your bill to get the ball rolling",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      letterSpacing: 0.38),
                                ),
                              ]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
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
                              height: 12,
                            ),
                            GetBuilder<KitController>(builder: (controller) {
                              final solars = controller.solars;
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (var i = 0; i < 3; i++)
                                    MiniProductTile(
                                      count: solars[i],
                                      title: "${solars[i] * 76} kWh",
                                      subtitle: "Monthly Prod.",
                                      imagePath: 'assets/images/solar.png',
                                      onIncrement: () {
                                        controller.incrementSolars(i);
                                      },
                                      onDecrement: () {
                                        controller.decrementSolars(i);
                                      },
                                    )
                                ],
                              );
                            }),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: const Color(0xFFC7C7CC),
                                  )),
                              child: Row(children: [
                                SizedBox(
                                  height: 42,
                                  width: 42,
                                  child: Image.asset(
                                      "assets/images/Deye2-Hybrid-inverter-12kw-300x300 (1).jpg"),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Add option",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "US3000 Cabinet (2 Batteries)",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "R2,944.03",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          ]),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "You can have a max of ",
                            style: TextStyle(
                                color: greyDark,
                                fontSize: 12,
                                letterSpacing: 0.38),
                          ),
                          Text(
                            "35 Panels",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: greyDark,
                                fontSize: 12,
                                letterSpacing: 0.38),
                          ),
                          Text(
                            " with inverter.",
                            style: TextStyle(
                                color: greyDark,
                                fontSize: 12,
                                letterSpacing: 0.38),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 18),
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
                                    border: Border.all(
                                        color: const Color(0xFF434343))),
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
                    const SizedBox(height: 180),
                  ]),
            ),
            Positioned(
                bottom: 0,
                child: GetBuilder<KitController>(builder: (controller) {
                  final totalSolars = controller.solars
                      .reduce((value, element) => value + element);
                  final price = product.price * totalSolars;
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
                              width: Get.width * 0.3,
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
                            const SizedBox(
                              width: 38,
                            ),
                            SizedBox(
                              width: Get.width * 0.3,
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
