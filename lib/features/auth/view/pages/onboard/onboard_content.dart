import 'package:flutter/material.dart';
import 'package:fusionpower/common/colors.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Image.asset(
            image,
          ),
        ),
        const SizedBox(
          height: 38,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: labelColorPrimary,
              fontSize: 24,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 14,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: labelColorSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
