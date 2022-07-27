import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/view/pages/Cart/widgets/stepper.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<Widget> cartPages = [
    Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text('Page 1'),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text('Page 2'),
      ),
    ),
    Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('Page 3'),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

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
        title: const Text(
          "Cart",
          style: TextStyle(
            color: labelColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Column(children: [
          CartStepper(),
          GetBuilder<CartController>(builder: (controller) {
            return Expanded(
                child: PageView.builder(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            controller.incrementcurrentStep();
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          },
                          child: cartPages[index]);
                    }));
          })
        ]),
      ),
    );
  }
}
