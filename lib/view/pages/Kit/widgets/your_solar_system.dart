import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/view/pages/Kit/widgets/mini_product_tile.dart';
import 'package:fusionpower/view/pages/Kit/widgets/product_selection_tile.dart';
import 'package:get/get.dart';

class YourSolarSystemWidget extends StatelessWidget {
  const YourSolarSystemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            color: Color(0xFF898A8D),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GetBuilder<KitController>(builder: (controller) {
          final products = controller.products;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < 3; i++)
                MiniProductTile(
                  count: products[i]['count'],
                  title: products[i]['title'],
                  subtitle: products[i]['subtitle'],
                  imagePath: products[i]['imgPath'],
                  onIncrement: () {
                    controller.incrementProductCount(i);
                  },
                  onDecrement: () {
                    controller.decrementProductCount(i);
                  },
                  showChangeButton: i >= 1,
                )
            ],
          );
        }),
        const SizedBox(height: 16),
        const ProductSelectionTile(
          imgPath: "assets/images/Deye2-Hybrid-inverter-12kw-300x300 (1).jpg",
          price: 2944.05,
          title: "Deye2 Hybrid Inverter 12kw",
        ),
        const SizedBox(height: 12),
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
                    color: greyDark, fontSize: 12, letterSpacing: 0.38),
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
                    color: greyDark, fontSize: 12, letterSpacing: 0.38),
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
              style:
                  TextStyle(color: greyDark, fontSize: 13, letterSpacing: 0.38),
            ),
          ]),
        ),
      ]),
    );
  }
}
