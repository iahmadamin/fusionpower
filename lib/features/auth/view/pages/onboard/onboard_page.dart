import 'package:flutter/material.dart';
import 'package:fusionpower/common/colors.dart';
import 'package:fusionpower/features/auth/view/pages/login/login_page.dart';
import 'package:fusionpower/widgets/c_button.dart';
import 'package:get/get.dart';

import 'onboard_content.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<Map<String, String>> onboardData = [
    {
      'image': 'assets/images/onboard1.png',
      'title': 'Online Shopping',
      'description':
          'Buy anything you need anywhere and anytime with the guarantee of the best goods.',
    },
    {
      'image': 'assets/images/onboard2.png',
      'title': 'An Affordable Price',
      'description':
          'we have very cheap prices with easy and simple transactions',
    },
    {
      'image': 'assets/images/onboard3.png',
      'title': 'Tracking your Shipments',
      'description':
          'Use the tracking system feature to get information about the courier on the map',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardData.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardContent(
                  image: onboardData[index]['image']!,
                  title: onboardData[index]['title']!,
                  description: onboardData[index]['description']!,
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                onboardData.length, (index) => buildDot(index: index)),
          ),
          const SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CButton(
              label: "Getting Started",
              onTap: () {
                Get.off(() => const LoginPage());
              },
            ),
          ),
          const SizedBox(
            height: 38,
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 7),
      height: _currentPage == index ? 8 : 8,
      width: _currentPage == index ? 40 : 8,
      decoration: BoxDecoration(
          color: _currentPage == index ? Colors.black : fillColorPrimary,
          shape:
              _currentPage == index ? BoxShape.rectangle : BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16)),
    );
  }
}
