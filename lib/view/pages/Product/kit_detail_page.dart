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
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 12),
                      child: Text(
                        product.title,
                        style: const TextStyle(
                            color: greyDark,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.38),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 4),
                      child: Text(
                        "Bundle Test Product",
                        style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.38,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF898A8D),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 16),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Starting At",
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF898A8D),
                                ),
                              ),
                              const Text(
                                "19,000 PKR.",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: greyDark,
                                ),
                              ),
                              const Text(
                                "Inc VAT.",
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF898A8D),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pay Monthly",
                                style: TextStyle(
                                  fontSize: 10,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF898A8D),
                                ),
                              ),
                              const Text(
                                "19,000 PKR.",
                                style: TextStyle(
                                  fontSize: 14,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                  color: greyDark,
                                ),
                              ),
                              const Text(
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
                          CButton(
                            label: "Apply Today",
                            onTap: () {},
                            height: 26,
                            width: 80,
                            filled: false,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Enter Your Highest Monthly bill",
                                  style: TextStyle(
                                    fontSize: 12,
                                    letterSpacing: 0.38,
                                    fontWeight: FontWeight.w700,
                                    color: greyDark,
                                  ),
                                ),
                                const Text(
                                  "Inc VAT.",
                                  style: TextStyle(
                                    fontSize: 10,
                                    letterSpacing: 0.38,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF898A8D),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  height: 26,
                                  width: 170,
                                  child: TextField(
                                    cursorColor: greyDark,
                                    style: const TextStyle(
                                        fontSize: 10, color: greyDark),
                                    decoration: InputDecoration(
                                        hintText: "Enter Bill",
                                        hintStyle: const TextStyle(
                                            color: Color(0xFF898A8D),
                                            fontSize: 10,
                                            fontStyle: FontStyle.italic),
                                        isDense: true,
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                                minWidth: 32, maxHeight: 32),
                                        contentPadding: const EdgeInsets.only(
                                            left: 0, bottom: 6),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.25)),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black
                                                  .withOpacity(0.25)),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 34,
                                  width: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.black,
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
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
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
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
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
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF898A8D),
                                    ),
                                  ),
                                  Text(
                                    "${(price / 60).toStringAsFixed(0)} PKR.",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      letterSpacing: 0.38,
                                      fontWeight: FontWeight.w600,
                                      color: greyDark,
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
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF898A8D),
                                    ),
                                  ),
                                  Text(
                                    "${price} PKR.",
                                    style: const TextStyle(
                                      fontSize: 16,
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
                        CButton(
                            label: "Create Quote",
                            onTap: () {
                              Get.to(() => YourDetailsPage());
                            })
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
