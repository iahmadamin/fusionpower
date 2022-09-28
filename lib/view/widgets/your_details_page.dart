import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:fusionpower/view/widgets/rinput_feild.dart';
import 'package:fusionpower/view/widgets/woo_component_tile.dart';
import 'package:get/get.dart';

class YourDetailsPage extends StatefulWidget {
  const YourDetailsPage(
      {Key? key,
      required this.kit,
      required this.installationCost,
      required this.registrationFee})
      : super(key: key);
  final Kit kit;
  final double installationCost, registrationFee;

  @override
  State<YourDetailsPage> createState() => _YourDetailsPageState();
}

class _YourDetailsPageState extends State<YourDetailsPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;
  late final TextEditingController postalController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ApiController apiController = Get.find<ApiController>();

  final List<String> roofTypeList = [
    "Select Option",
    "Flat Roof",
    "Tiled Roof",
    "IBR",
    "Corrugated",
    "Other"
  ];
  String selectedRoofType = "Select Option";

  final List<String> cityList = [
    'Select City',
    'Johannesburg',
    'Preoria',
    'Cape Town',
  ];
  String selectedCity = 'Select City';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    postalController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    postalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                        padding: EdgeInsets.only(top: 16, right: 16),
                        child: Icon(Icons.close)),
                  ),
                ),
                Text(
                  widget.kit.kitType == KitType.solar
                      ? "Your Solar System"
                      : "Your Loadshedding Kit",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: labelColorPrimary,
                  ),
                ),
                const Text(
                  "A high-level look at the system",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF898A8D),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0;
                          i < widget.kit.wooComComponents.length;
                          i++)
                        WooComponentTile(
                          wooCom: widget.kit.wooComComponents[i],
                          index: i,
                          kitType: widget.kit.kitType,
                          static: true,
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
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
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(children: [
                    const Text(
                      "Your Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: labelColorPrimary,
                      ),
                    ),
                    const Text(
                      "Enter Your information",
                      style: TextStyle(
                        fontSize: 12,
                        letterSpacing: 0.38,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF898A8D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RInputField(
                      controller: nameController,
                      hint: "Full Name",
                      label: "Full Name",
                      textInputType: TextInputType.text,
                      validator: (val) => Validators.defaultValidator(val),
                    ),
                    RInputField(
                      controller: emailController,
                      hint: "Email",
                      label: "Email",
                      textInputType: TextInputType.emailAddress,
                      validator: (val) => Validators.emailValidator(val),
                    ),
                    RInputField(
                      controller: phoneController,
                      hint: "+27",
                      label: "Phone Number",
                      textInputType: TextInputType.phone,
                      validator: (val) => Validators.phoneValidator(val),
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Roof Type",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 46,
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                      decoration: BoxDecoration(
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(32)),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(4),
                        isExpanded: true,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        underline: Container(),
                        elevation: 0,
                        value: selectedRoofType,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Color(0xFF898A8D),
                        ),
                        items: roofTypeList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                item,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              selectedRoofType = newValue!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RInputField(
                      controller: addressController,
                      hint: "House number, street name",
                      label: "Home Address",
                      textInputType: TextInputType.text,
                      validator: (val) => Validators.defaultValidator(val),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "City",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 46,
                      padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
                      decoration: BoxDecoration(
                          color: const Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(32)),
                      child: DropdownButton<String>(
                        borderRadius: BorderRadius.circular(4),
                        isExpanded: true,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        underline: Container(),
                        elevation: 0,
                        value: selectedCity,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Color(0xFF898A8D),
                        ),
                        items: cityList.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                item,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(
                            () {
                              selectedCity = newValue!;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RInputField(
                      controller: postalController,
                      hint: "Postal Code",
                      label: "Postal Code",
                      textInputType: TextInputType.number,
                      validator: (val) => Validators.defaultValidator(val),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CButton(
                        label: "Submit",
                        width: 180,
                        borderSize: 2,
                        filled: false,
                        fontColor: Colors.black,
                        color: Colors.black,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            submitQuoteData();
                          }
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitQuoteData() {
    final List<Map<String, dynamic>> cartProducts = [];
    for (var el in widget.kit.wooComComponents) {
      if (el.qty > 0) {
        cartProducts.add({
          "product_type": el.name,
          "product_id": el.defaultProduct!.id,
          "quantity": el.qty
        });
      }
    }
    if (widget.installationCost > 0) {
      cartProducts.add({
        "addon": 'Installation Cost',
        "price": widget.installationCost / 1.15
      });
    }
    if (widget.registrationFee > 0) {
      cartProducts.add({
        "addon": 'Registration Fee',
        "price": widget.registrationFee / 1.15
      });
    }

    final userData = {
      "type": 'User Details',
      "full_name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "address": addressController.text,
      "city": selectedCity,
      "postal_code": postalController.text,
      "roof_type": selectedRoofType
    };

    final data = {
      'cart_data': cartProducts,
      'user_data': userData,
    };

    for (var product in cartProducts) {
      log(product.toString());
    }

    apiController.submitQuote(data);
  }
}
