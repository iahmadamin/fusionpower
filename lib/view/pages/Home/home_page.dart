import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Home/widgets/drawer.dart';
import 'package:fusionpower/view/widgets/mini_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = productList[0];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: greyDark),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MiniButton(
              onTap: () {},
              label: "(021) 012 5336",
              icon: Icons.call,
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset("assets/svgs/cart.svg"),
            )
          ],
        ),
      ),
      drawer: const HomeDrawer(),
      body: SizedBox.expand(
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
                      "Product Description",
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
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: productDataBGColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        color: greyDark,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.38),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 22,
                        width: 78,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: primaryPurple,
                        ),
                        child: const Center(
                          child: Text(
                            "Apply Today",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Text(
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
                  const SizedBox(
                    width: 38,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
