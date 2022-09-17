// import 'package:flutter/material.dart';
// import 'package:fusionpower/constant/colors.dart';
// import 'package:fusionpower/controllers/cart_controller.dart';
// import 'package:get/get.dart';

// class CartStepper extends StatelessWidget {
//   CartStepper({
//     Key? key,
//   }) : super(key: key);

//   final List<String> stepNames = [
//     "Shopping Cart",
//     "Shipping & Checkout",
//     "Confirmation"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CartController>(builder: (controller) {
//       return SizedBox(
//         height: 80,
//         width: Get.width,
//         child: Stack(
//           children: [
//             Positioned(
//               top: 18,
//               child: Container(
//                 height: 4,
//                 width: Get.width,
//                 color: Colors.grey[200],
//               ),
//             ),
//             Positioned(
//               top: 18,
//               child: AnimatedContainer(
//                 height: 4,
//                 width: Get.width * (controller.currentStep / 3),
//                 color: pastelGreen,
//                 duration: const Duration(milliseconds: 300),
//               ),
//             ),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//               for (var i = 1; i <= 3; i++)
//                 Step(
//                   number: i,
//                   label: stepNames[i - 1],
//                   active: controller.currentStep >= i,
//                 ),
//             ]),
//           ],
//         ),
//       );
//     });
//   }
// }

// class Step extends StatelessWidget {
//   const Step({
//     Key? key,
//     required this.label,
//     required this.active,
//     required this.number,
//   }) : super(key: key);
//   final String label;
//   final bool active;
//   final int number;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 20,
//           backgroundColor: Colors.white,
//           child: CircleAvatar(
//               radius: 18,
//               backgroundColor: active ? greyDark : Colors.grey[400],
//               child: Text(
//                 number.toString(),
//                 style: const TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               )),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//             color: active ? Colors.black : labelColorSecondary,
//           ),
//         ),
//       ],
//     );
//   }
// }
