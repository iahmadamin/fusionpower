// import 'package:flutter/material.dart';
// import 'package:fusionpower/constant/colors.dart';
// import 'package:fusionpower/constant/utils.dart';
// import 'package:fusionpower/controllers/cart_controller.dart';
// import 'package:fusionpower/view/widgets/c_button.dart';
// import 'package:fusionpower/view/widgets/uinput_field.dart';
// import 'package:get/get.dart';

// class Billing extends StatefulWidget {
//   const Billing({Key? key, required this.pageController}) : super(key: key);

//   final PageController pageController;

//   @override
//   State<Billing> createState() => _BillingState();
// }

// class _BillingState extends State<Billing> {
//   late final TextEditingController fNameController;
//   late final TextEditingController lNameController;
//   late final TextEditingController companyNameController;
//   late final TextEditingController countryRegionController;
//   late final TextEditingController streetAddressController;
//   late final TextEditingController appartmentController;

//   @override
//   void initState() {
//     super.initState();
//     fNameController = TextEditingController();
//     lNameController = TextEditingController();
//     companyNameController = TextEditingController();
//     countryRegionController = TextEditingController();
//     streetAddressController = TextEditingController();
//     appartmentController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     fNameController.dispose();
//     lNameController.dispose();
//     companyNameController.dispose();
//     countryRegionController.dispose();
//     streetAddressController.dispose();
//     appartmentController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       resizeToAvoidBottomInset: false,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 26),
//         child: Column(children: [
//           const SizedBox(height: 26),
//           const Text(
//             "Billing Details",
//             style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: Color(0xFF434343)),
//           ),
//           const SizedBox(height: 16),
//           UInputField(
//               controller: fNameController,
//               hint: "First Name",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           UInputField(
//               controller: fNameController,
//               hint: "Last Name",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           UInputField(
//               controller: fNameController,
//               hint: "Company Name (Optional)",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           UInputField(
//               controller: fNameController,
//               hint: "Country / Region",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           UInputField(
//               controller: fNameController,
//               hint: "Street Address",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           UInputField(
//               controller: fNameController,
//               hint: "Appartment",
//               textInputType: TextInputType.text,
//               validator: (val) => Validators.defaultValidator(val)),
//           const SizedBox(
//             height: 26,
//           ),
//           CButton(
//             label: "Proceed to Confirmation",
//             onTap: () {
//               final CartController controller = Get.find();
//               controller.incrementcurrentStep();
//               widget.pageController.nextPage(
//                   duration: const Duration(milliseconds: 200),
//                   curve: Curves.easeIn);
//             },
//             fontSize: 12,
//             borderRadius: 12,
//           ),
//           const SizedBox(
//             height: 32,
//           ),
//         ]),
//       ),
//     );
//   }
// }
