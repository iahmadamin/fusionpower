import 'package:flutter/material.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/view/widgets/uinput_field.dart';
import 'package:get/get.dart';

class UserInformationDialogContent extends StatefulWidget {
  const UserInformationDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInformationDialogContent> createState() =>
      UserInformationDialogContentState();
}

class UserInformationDialogContentState
    extends State<UserInformationDialogContent> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController addressController;

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
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 420,
      width: Get.width * 0.98,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Column(children: [
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
        UInputField(
          controller: nameController,
          hint: "Full Name",
          textInputType: TextInputType.text,
          validator: (val) => Validators.defaultValidator(val),
        ),
        UInputField(
          controller: emailController,
          hint: "Email",
          textInputType: TextInputType.emailAddress,
          validator: (val) => Validators.emailValidator(val),
        ),
        UInputField(
          controller: phoneController,
          hint: "Phone No.",
          textInputType: TextInputType.phone,
          validator: (val) => Validators.defaultValidator(val),
        ),
        SizedBox(
          height: 32,
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(4),
            isExpanded: true,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC7C7CC),
            ),
            underline: Container(
              height: 1,
              color: const Color(0xFFE7E7E7),
            ),
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
        UInputField(
          controller: addressController,
          hint: "Home Address",
          textInputType: TextInputType.text,
          validator: (val) => Validators.defaultValidator(val),
        ),
        SizedBox(
          height: 32,
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(4),
            isExpanded: true,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFFC7C7CC),
            ),
            underline: Container(
              height: 1,
              color: Color(0xFFE7E7E7),
            ),
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
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 34,
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.black,
              ),
              child: const Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 0.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )),
        const SizedBox(
          height: 8,
        ),
      ]),
    );
  }
}
