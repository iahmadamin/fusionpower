// import 'package:flutter/material.dart';
// import 'package:fusionpower/constant/colors.dart';
// import 'package:fusionpower/controllers/cart_controller.dart';
// import 'package:fusionpower/models/product_model.dart';
// import 'package:get/get.dart';

// import 'user_info_dialog_content.dart';

// class ProductDataTile extends StatelessWidget {
//   const ProductDataTile({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final Product product;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(12),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: productDataBGColor,
//       ),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               product.title,
//               style: const TextStyle(
//                   color: greyDark,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w700,
//                   letterSpacing: 0.38),
//             ),
//             GestureDetector(
//                 onTap: () {
//                   final CartController controller = Get.find();
//                   controller.addProduct(product);
//                   Get.snackbar(
//                       "Added to Cart!", "Product has been added to your cart.",
//                       backgroundColor: pastelGreen, colorText: Colors.white);
//                 },
//                 child: Container(
//                   height: 22,
//                   width: 78,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: primaryPurple,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Apply Today",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//         const SizedBox(
//           height: 4,
//         ),
//         const Text(
//           "Bundle Test Product",
//           style: TextStyle(
//             fontSize: 12,
//             letterSpacing: 0.38,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF898A8D),
//           ),
//         ),
//         const SizedBox(
//           height: 12,
//         ),
//         Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Starting At",
//                   style: TextStyle(
//                     fontSize: 10,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF898A8D),
//                   ),
//                 ),
//                 const Text(
//                   "19,000 PKR.",
//                   style: TextStyle(
//                     fontSize: 14,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: greyDark,
//                   ),
//                 ),
//                 const Text(
//                   "Inc VAT.",
//                   style: TextStyle(
//                     fontSize: 10,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF898A8D),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               width: 38,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Pay Monthly",
//                   style: TextStyle(
//                     fontSize: 10,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF898A8D),
//                   ),
//                 ),
//                 const Text(
//                   "19,000 PKR.",
//                   style: TextStyle(
//                     fontSize: 14,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: greyDark,
//                   ),
//                 ),
//                 const Text(
//                   "60 Months @ 16% APR",
//                   style: TextStyle(
//                     fontSize: 10,
//                     letterSpacing: 0.38,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF898A8D),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//         const SizedBox(height: 12),
//         GestureDetector(
//             onTap: () {
//               getUserInformationDialog(context);
//             },
//             child: Container(
//               height: 34,
//               width: 112,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(24),
//                 color: primaryPurple,
//               ),
//               child: const Center(
//                 child: Text(
//                   "Create Quote",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     letterSpacing: 0.4,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             )),
//         const SizedBox(height: 24),
//         const Text(
//           "Enter Your Highest Monthly bill",
//           style: TextStyle(
//             fontSize: 14,
//             letterSpacing: 0.38,
//             fontWeight: FontWeight.w700,
//             color: greyDark,
//           ),
//         ),
//         const Text(
//           "Inc VAT.",
//           style: TextStyle(
//             fontSize: 10,
//             letterSpacing: 0.38,
//             fontWeight: FontWeight.w600,
//             color: Color(0xFF898A8D),
//           ),
//         ),
//         const SizedBox(height: 8),
//         SizedBox(
//           height: 26,
//           width: 170,
//           child: TextField(
//             cursorColor: greyDark,
//             style: const TextStyle(fontSize: 10, color: greyDark),
//             decoration: InputDecoration(
//                 hintText: "Enter Bill",
//                 hintStyle: const TextStyle(
//                     color: Color(0xFF898A8D),
//                     fontSize: 10,
//                     fontStyle: FontStyle.italic),
//                 isDense: true,
//                 prefixIconConstraints:
//                     const BoxConstraints(minWidth: 32, maxHeight: 32),
//                 contentPadding: const EdgeInsets.only(left: 0, bottom: 6),
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black.withOpacity(0.25)),
//                 )),
//           ),
//         ),
//         const SizedBox(height: 14),
//         GestureDetector(
//             onTap: () {},
//             child: Container(
//               height: 34,
//               width: 88,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(24),
//                 color: Colors.black,
//               ),
//               child: const Center(
//                 child: Text(
//                   "Update",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                     letterSpacing: 0.4,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//             )),
//       ]),
//     );
//   }

//   Future<T?> getUserInformationDialog<T>(BuildContext context) async {
//     return Get.defaultDialog(
//       title: "Your Details",
//       titleStyle: const TextStyle(
//           color: greyDark,
//           fontSize: 16,
//           fontWeight: FontWeight.w700,
//           letterSpacing: 0.38),
//       titlePadding: const EdgeInsets.only(top: 16, bottom: 0),
//       contentPadding: const EdgeInsets.only(top: 0),
//       content: const UserInformationDialogContent(),
//     );
//   }
// }
