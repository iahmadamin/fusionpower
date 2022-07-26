import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class CButton extends StatelessWidget {
  const CButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.filled = true,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: filled ? Colors.black : backgroundColor,
            border: filled
                ? null
                : Border.all(
                    color: primaryPurple,
                  )),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 17,
                color: filled ? Colors.white : primaryPurple,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
