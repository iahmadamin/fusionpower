import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:fusionpower/view/widgets/uinput_field.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 18,
              color: primaryPurple,
            ),
            onTap: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.chat_outlined,
              size: 18,
              color: primaryPurple,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(
            height: 132,
            width: 132,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CircleAvatar(
                  radius: 56,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              spreadRadius: 4,
                            )
                          ]),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: greyDark,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Wassi Ahsan",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: labelColorPrimary,
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          UInputField(
            controller: nameController,
            hint: "Full Name",
            textInputType: TextInputType.text,
            validator: (val) => Validators.defaultValidator(val),
            fontSize: 16,
          ),
          const SizedBox(
            height: 8,
          ),
          UInputField(
            controller: emailController,
            hint: "Email Address",
            textInputType: TextInputType.emailAddress,
            validator: (val) => Validators.emailValidator(val),
            fontSize: 16,
          ),
          const SizedBox(
            height: 8,
          ),
          UInputField(
            controller: addressController,
            hint: "Address",
            textInputType: TextInputType.text,
            validator: (val) => Validators.defaultValidator(val),
            fontSize: 16,
          ),
          const SizedBox(height: 32),
          CButton(
              label: "Update",
              onTap: () {
                Get.back();
              })
        ]),
      ),
    );
  }
}
