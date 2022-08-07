import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class CButton extends StatelessWidget {
  const CButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.filled = true,
    this.height = 48,
    this.borderRadius = 24,
    this.color = Colors.black,
    this.fontColor = Colors.white,
    this.fontSize = 17,
    this.borderSize = 1,
    this.width = double.infinity,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool filled;
  final double height, width;
  final double borderRadius;
  final Color color, fontColor;
  final double fontSize, borderSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: filled ? color : backgroundColor,
            border: filled
                ? null
                : Border.all(
                    width: borderSize,
                    color: color,
                  )),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: fontSize,
                color: fontColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
