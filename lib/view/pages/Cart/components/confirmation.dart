// import 'package:flutter/material.dart';
// import 'package:fusionpower/constant/colors.dart';
// import 'package:fusionpower/controllers/cart_controller.dart';
// import 'package:fusionpower/view/pages/Cart/components/cart.dart';
// import 'package:fusionpower/view/widgets/c_button.dart';
// import 'package:get/get.dart';

// class Confirmation extends StatelessWidget {
//   const Confirmation({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 26),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 26),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Additional Information",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF434343)),
//                 ),
//               ),
//               const SizedBox(height: 4),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Order Notes (Optional)",
//                   style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF898A8D)),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 cursorColor: greyDark,
//                 style: const TextStyle(
//                     fontSize: 12, fontWeight: FontWeight.w500, color: greyDark),
//                 maxLines: 2,
//                 decoration: InputDecoration(
//                   hintText: "Notes About your Order (e.g.   )",
//                   hintStyle: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF898A8D)),
//                   filled: true,
//                   fillColor: const Color(0xFFF4F4F4),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Color(0xFFF4F4F4)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: const BorderSide(color: Color(0xFFF4F4F4)),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 22),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Your Order",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF434343)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               GetBuilder<CartController>(builder: (controller) {
//                 return Column(children: [
//                   for (var i = 0; i < controller.cart.length; i++)
//                     CartItem(
//                       name: controller.cart[i].title,
//                       imgPath: controller.cart[i].imagePath,
//                       price: controller.cart[i].price,
//                       onTap: () {
//                         controller.removeItem(controller.cart[i]);
//                       },
//                     ),
//                   const SizedBox(
//                     height: 22,
//                   ),
//                   Container(
//                     height: 46,
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xFFE7E7E7))),
//                     child: Row(children: [
//                       const Text(
//                         "Subtotal",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Color(0xFF898A8D),
//                             fontWeight: FontWeight.w600),
//                       ),
//                       const Spacer(),
//                       Text(
//                         "${controller.subTotalPrice} PKR.",
//                         style: const TextStyle(
//                             fontSize: 14,
//                             color: Color(0xFF434343),
//                             fontWeight: FontWeight.w700),
//                       )
//                     ]),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Container(
//                     height: 62,
//                     padding: const EdgeInsets.symmetric(horizontal: 24),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: const Color(0xFFE7E7E7))),
//                     child: Row(children: [
//                       const Text(
//                         "Total",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Color(0xFF898A8D),
//                             fontWeight: FontWeight.w600),
//                       ),
//                       const Spacer(),
//                       Text(
//                         "${controller.totalPrice} PKR.",
//                         style: const TextStyle(
//                             fontSize: 16,
//                             color: Color(0xFF434343),
//                             fontWeight: FontWeight.w700),
//                       )
//                     ]),
//                   ),
//                 ]);
//               }),
//               const SizedBox(height: 20),
//               Container(
//                 height: 88,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: const Color(0xFFF4F4F4),
//                 ),
//                 child: const Center(
//                     child: Text(
//                   "Sorry it seems that there are no available Payment",
//                   style: TextStyle(
//                     color: Color(0xFF898A8D),
//                     fontSize: 12,
//                   ),
//                 )),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 """
// Your personal Data will be used to process
// you order, support your experience...
// """,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Color(0xFF898A8D),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Privacy Policy",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF434343)),
//                 ),
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//               CButton(
//                 label: "Place Order",
//                 onTap: () {},
//                 height: 52,
//                 fontSize: 14,
//                 borderRadius: 12,
//               ),
//               const SizedBox(
//                 height: 32,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
