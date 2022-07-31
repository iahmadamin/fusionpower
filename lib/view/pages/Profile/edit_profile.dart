import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/controllers/profile_controller.dart';
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
  final _profileController = Get.find<ProfileController>();

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "My Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 18,
              color: primaryPurple,
            ),
            onTap: () {},
          ),
          IconButton(
            icon: const Icon(
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
                GetBuilder<ProfileController>(builder: (con) {
                  return Container(
                    height: 112,
                    width: 112,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: con.imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(56),
                            child: Image.file(
                              con.imageFile!,
                              fit: BoxFit.cover,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(56),
                            child: Image.asset(
                              'assets/images/user.png',
                              fit: BoxFit.cover,
                            )),
                  );
                }),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: GestureDetector(
                    onTap: () {
                      imagePickerDialog();
                    },
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
          const Text(
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

  Future<void> imagePickerDialog() {
    return Get.defaultDialog(
      title: "Choose Image or take a photo",
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      titlePadding: const EdgeInsets.fromLTRB(
        24,
        32,
        24,
        16,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
              _profileController.getImageFromCamer();
            },
            child: Column(
              children: const [
                Icon(
                  Icons.photo_camera_outlined,
                  size: 36,
                  color: primaryPurple,
                ),
                Text(
                  "Camera",
                  style: TextStyle(
                    fontSize: 14,
                    color: labelColorSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
              _profileController.getImageFromGallery();
            },
            child: Column(
              children: const [
                Icon(
                  Icons.image,
                  size: 36,
                  color: primaryPurple,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(
                    fontSize: 14,
                    color: labelColorSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
