import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuoteStickyBottomWidget extends StatelessWidget {
  const QuoteStickyBottomWidget({
    Key? key,
    required this.kit,
  }) : super(key: key);

  final Kit kit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Container(
          height: 140,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 8, spreadRadius: 8),
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
                          "R${NumberFormat('###,###,###.##').format(kit.pricePerMonth)}",
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
                          "R${NumberFormat('###,###,###.##').format(kit.totalPrice)}",
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
                    label: "Create Quote", color: primaryBlue, onTap: () {}),
              )
            ],
          ),
        ));
  }
}
