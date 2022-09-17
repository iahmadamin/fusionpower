// import 'package:flutter/material.dart';
// import 'package:fusionpower/constant/colors.dart';
// import 'package:fusionpower/controllers/cart_controller.dart';
// import 'package:fusionpower/view/pages/Cart/components/billing.dart';
// import 'package:fusionpower/view/pages/Cart/components/cart.dart';
// import 'package:fusionpower/view/pages/Cart/components/confirmation.dart';
// import 'package:fusionpower/view/pages/Cart/widgets/stepper.dart';
// import 'package:get/get.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({Key? key}) : super(key: key);

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   late final List<Widget> cartPages;
//   late final CartController controller;
//   late final PageController pageController;

//   @override
//   void initState() {
//     pageController = PageController();
//     controller = Get.find();
//     super.initState();
//     cartPages = [
//       Cart(
//         pageController: pageController,
//       ),
//       Billing(pageController: pageController),
//       const Confirmation(),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: backgroundColor,
//         elevation: 0.0,
//         leading: GestureDetector(
//           onTap: () {
//             if (controller.currentStep > 1) {
//               controller.decrementcurrentStep();
//               pageController.previousPage(
//                   duration: const Duration(milliseconds: 200),
//                   curve: Curves.easeIn);
//             } else {
//               Get.back();
//             }
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             color: primaryPurple,
//           ),
//         ),
//         title: const Text(
//           "Cart",
//           style: TextStyle(
//             color: labelColorPrimary,
//             fontWeight: FontWeight.w600,
//             fontSize: 17,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SizedBox.expand(
//         child: Column(children: [
//           CartStepper(),
//           GetBuilder<CartController>(builder: (controller) {
//             return Expanded(
//                 child: PageView.builder(
//                     controller: pageController,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       return cartPages[index];
//                     }));
//           })
//         ]),
//       ),
//     );
//   }
// }
