import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/constant/utils.dart';
import 'package:fusionpower/view/pages/Auth/login_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:fusionpower/view/widgets/input_field.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final GlobalKey formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController fNameController;
  late final TextEditingController lNameController;
  late final TextEditingController phoneController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryPurple,
          ),
        ),
        title: const Text(
          "Create an Account",
          style: TextStyle(
            color: labelColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 16,
              ),
              Form(
                key: formKey,
                child: Column(children: [
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: fNameController,
                          hint: 'First Name',
                          validator: (val) => Validators.defaultValidator(val),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InputField(
                          controller: lNameController,
                          hint: 'Last Name',
                          validator: (val) => Validators.defaultValidator(val),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const CountryCodePicker(),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InputField(
                          textInputType: TextInputType.number,
                          controller: phoneController,
                          hint: 'Mobile Number',
                          validator: (val) => Validators.defaultValidator(val),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    textInputType: TextInputType.emailAddress,
                    hint: "Email Address",
                    controller: emailController,
                    validator: (val) => Validators.emailValidator(val),
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    textInputType: TextInputType.visiblePassword,
                    hint: "Password",
                    isPass: true,
                    controller: passwordController,
                    validator: (val) => Validators.passwordValidator(val),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              Text(
                "By signing up for a Elektra account you are agreeing to our community Terms of service and privacy policy",
                style: TextStyle(
                  fontSize: 12,
                  color: labelColorSecondary,
                ),
              ),
              const SizedBox(height: 24),
              CButton(label: "Sign Up", onTap: () {}),
              const SizedBox(height: 24),
              Text(
                'Or Sign up with',
                style: TextStyle(color: labelColorSecondary, fontSize: 16),
              ),
              const SizedBox(height: 24),
              CButton(label: "Continue With FB", onTap: () {}, filled: false),
              const SizedBox(height: 16),
              CButton(
                  label: "Continue With Google", onTap: () {}, filled: false),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: labelColorPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.off(() => const LoginPage());
                    },
                    child: const Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({Key? key}) : super(key: key);

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  int pickedCountryCode = 62;

  List<int> countryCodes = [1, 3, 5, 62, 91, 92, 77, 53, 98, 13, 53];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFB9B9BB),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(4),
        style: const TextStyle(
          fontSize: 17,
          color: labelColorTertiary,
        ),
        underline: const SizedBox(),
        elevation: 0,
        value: pickedCountryCode,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 24,
          color: Color(0xFF8E8E93),
        ),
        items: countryCodes.map((int item) {
          return DropdownMenuItem(
            value: item,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 4,
                right: 4,
              ),
              child: Text(
                '+$item',
              ),
            ),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (int? newValue) {
          setState(
            () {
              pickedCountryCode = newValue!;
            },
          );
        },
      ),
    );
  }
}
