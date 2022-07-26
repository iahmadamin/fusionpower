import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
    this.color,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 22,
        width: 120,
        decoration: BoxDecoration(
          color: color ?? greyDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Icon(
            icon,
            size: 13,
            color: Colors.white,
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          )
        ]),
      ),
    );
  }
}
