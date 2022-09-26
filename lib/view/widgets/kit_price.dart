import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KitPriceWidget extends StatefulWidget {
  const KitPriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<KitPriceWidget> createState() => _KitPriceWidgetState();
}

class _KitPriceWidgetState extends State<KitPriceWidget> {
  final KitController kitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              Text(
                "R${NumberFormat('###,###,###').format(kitController.kit!.pricePerMonth)}",
                style: const TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.w600,
                  color: greyDark,
                ),
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
            ],
          ),
          const SizedBox(
            width: 28,
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
              Text(
                "R${NumberFormat('###,###,###').format(kitController.kit!.pricePerMonth)}",
                style: const TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF009D90),
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
          const Spacer(),
          CButton(
            fontColor: primaryBlue,
            color: primaryBlue.withOpacity(0.1),
            label: "Apply Today",
            onTap: () {},
            height: 28,
            width: 90,
            filled: true,
            fontSize: 9,
          ),
        ],
      ),
    );
  }
}
