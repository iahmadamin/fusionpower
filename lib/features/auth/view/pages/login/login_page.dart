import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fusionpower/common/colors.dart';
import 'package:fusionpower/common/utils.dart';
import 'package:fusionpower/features/auth/view/pages/signup/signup_page.dart';
import 'package:fusionpower/widgets/c_button.dart';
import 'package:fusionpower/widgets/input_field.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final GlobalKey formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
        title: const Text(
          "Login",
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
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondarySoftPurple,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: SvgPicture.asset(
                    'assets/svgs/logopurple.svg',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Fusion Power",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: labelColorPrimary,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Enter your e-mail account and password to browse Elektra",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: labelColorSecondary,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: formKey,
                child: Column(children: [
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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 16,
                      color: labelColorPrimary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CButton(label: "Login", onTap: () {}),
              const SizedBox(height: 24),
              Text(
                'Or',
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
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: labelColorPrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const SignupPage());
                    },
                    child: const Text(
                      'Sign Up',
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
