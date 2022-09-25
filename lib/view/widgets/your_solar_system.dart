import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/view/widgets/woo_component_tile.dart';
import 'package:get/get.dart';

class YourSolarSystemWidget extends StatefulWidget {
  const YourSolarSystemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<YourSolarSystemWidget> createState() => _YourSolarSystemWidgetState();
}

class _YourSolarSystemWidgetState extends State<YourSolarSystemWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<KitController>(builder: (controller) {
      return Container(
        margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
        padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            controller.kit!.kitType == KitType.solar
                ? "Your Solar System"
                : "Your Load Shedding Kit",
            style: const TextStyle(
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
              color: Color(0xFF898A8D),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < controller.wooComponents.length; i++)
                WooComponentTile(
                  wooCom: controller.wooComponents[i],
                  index: i,
                  kitType: controller.kit!.kitType,
                )
            ],
          ),
          const SizedBox(height: 16),
          if (controller.kit!.kitType == KitType.solar)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "You can have a max of ",
                    style: TextStyle(
                        color: greyDark, fontSize: 11, letterSpacing: 0.38),
                  ),
                  Text(
                    "35 Panels",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: greyDark,
                        fontSize: 11,
                        letterSpacing: 0.38),
                  ),
                  Text(
                    " with inverter.",
                    style: TextStyle(
                        color: greyDark, fontSize: 11, letterSpacing: 0.38),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: productDataBGColor,
            ),
            child: Column(children: const [
              Text(
                "Also includes everything you need",
                style: TextStyle(
                    color: greyDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.38),
              ),
              Text(
                "Brackets, Wiring, Switches And Fuses",
                style: TextStyle(
                    color: greyDark, fontSize: 13, letterSpacing: 0.38),
              ),
            ]),
          ),
        ]),
      );
    });
  }
}
