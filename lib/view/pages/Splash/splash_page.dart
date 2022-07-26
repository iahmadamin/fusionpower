import 'package:flutter/material.dart';
import 'package:fusionpower/view/pages/Auth/onboard_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        Get.off(() => const OnboardPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          "Fusion\nPower.",
          style: TextStyle(
              fontSize: 42,
              letterSpacing: 0.4,
              color: Colors.white,
              height: 0.8,
              fontFamily: 'Purple Purse'),
        ),
      ),
    );
  }
}
