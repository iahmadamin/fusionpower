import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/view/pages/Kit/quote_submitted_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:fusionpower/view/widgets/country_code_picker.dart';
import 'package:fusionpower/view/widgets/rounder_field.dart';
import 'package:get/get.dart';

class YourDetailsPage extends StatefulWidget {
  YourDetailsPage({Key? key}) : super(key: key);

  @override
  State<YourDetailsPage> createState() => _YourDetailsPageState();
}

class _YourDetailsPageState extends State<YourDetailsPage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;
  late final TextEditingController postalController;

  final List<String> roofTypeList = ["Roof Type", "Roof Type 1", "Roof Type 2"];
  String selectedRoofType = "Roof Type";

  final List<String> cityList = [
    'Select City',
    'Dhaka',
    'Chittagong',
    'Barisal',
    'Sylhet',
    'Rajshahi',
    'Khulna',
    'Rangpur',
    'Mymensingh',
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
                      child: const Icon(Icons.close)),
                ),
              ),
              const Text(
                "Your Solar System",
                style: TextStyle(
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
                    _ProductTile(
                      imgPath: "assets/images/solar.png",
                      title: "750 kWh",
                      subtitle: "Monthly Prod.",
                      count: 10,
                    ),
                    _ProductTile(
                      imgPath:
                          "assets/images/Deye2-Hybrid-inverter-8kw-300x300.jpg",
                      title: "12 kW",
                      subtitle: "Max Power",
                      count: 1,
                    ),
                    _ProductTile(
                      imgPath: "assets/images/Fusion_battery-300x300.jpg",
                      title: "4.8 kWh",
                      subtitle: "Storage",
                      count: 10,
                    ),
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
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Phone Number",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                        color: const Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(32)),
                    child: Row(
                      children: [
                        const CountryCodePicker(
                          border: false,
                        ),
                        const SizedBox(width: 8),
                        Padding(
                            padding: const EdgeInsets.only(top: 22),
                            child: Container()),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Padding(
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
                      // After selecting the desired option,it will
                      // change button value to selected value
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
                    hint: "Home Address",
                    label: "Home Address",
                    textInputType: TextInputType.text,
                    validator: (val) => Validators.defaultValidator(val),
                  ),
                  // DropdownButton<String>(
                  //   borderRadius: BorderRadius.circular(4),
                  //   isExpanded: true,
                  //   style: const TextStyle(
                  //     fontSize: 12,
                  //     fontWeight: FontWeight.w500,
                  //     color: Color(0xFFC7C7CC),
                  //   ),
                  //   underline: Container(
                  //     height: 1,
                  //     color: Color(0xFFE7E7E7),
                  //   ),
                  //   elevation: 0,
                  //   value: selectedCity,
                  //   icon: const Icon(
                  //     Icons.keyboard_arrow_down,
                  //     size: 24,
                  //     color: Color(0xFF898A8D),
                  //   ),
                  //   items: cityList.map((String item) {
                  //     return DropdownMenuItem(
                  //       value: item,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //           left: 8,
                  //           bottom: 8,
                  //         ),
                  //         child: Text(
                  //           item,
                  //         ),
                  //       ),
                  //     );
                  //   }).toList(),
                  //   // After selecting the desired option,it will
                  //   // change button value to selected value
                  //   onChanged: (String? newValue) {
                  //     setState(
                  //       () {
                  //         selectedCity = newValue!;
                  //       },
                  //     );
                  //   },
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Padding(
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
                      // After selecting the desired option,it will
                      // change button value to selected value
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
                        Get.to(() => const QuoteSubmittedPage());
                        // Get.offAll(() => const RootPage());
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //         content:
                        //             Text("Your application is submitted.")));
                      }),
                  // GestureDetector(
                  //     onTap: () {
                  //       Get.back();
                  //     },
                  //     child: Container(
                  //       height: 34,
                  //       width: 88,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(24),
                  //         color: Colors.black,
                  //       ),
                  //       child: const Center(
                  //         child: Text(
                  //           "Submit",
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 12,
                  //             letterSpacing: 0.4,
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //       ),
                  //     )),

                  const SizedBox(
                    height: 8,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile(
      {Key? key,
      required this.count,
      required this.title,
      required this.subtitle,
      required this.imgPath})
      : super(key: key);

  final String title, subtitle, imgPath;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 110,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFC7C7CC),
          )),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: 80,
          height: 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(imgPath),
              Positioned(
                  right: 0,
                  top: 22,
                  child: Container(
                    height: 26,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryBlue,
                    ),
                    child: Center(
                        child: Text(
                      "x$count",
                      style: const TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.35,
            fontWeight: FontWeight.w500,
            color: Color(0xFF898A8D),
          ),
        ),
      ]),
    );
  }
}
