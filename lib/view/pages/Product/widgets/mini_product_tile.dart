import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class MiniProductTile extends StatelessWidget {
  const MiniProductTile({
    Key? key,
    this.border = true,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  final bool border;
  final String title, subtitle, imagePath;
  final int count;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: border
            ? Border.all(
                color: const Color(0xFFC7C7CC),
              )
            : null,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(imagePath),
              Positioned(
                  right: 0,
                  top: 22,
                  child: Container(
                    height: 26,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryBlue,
                    ),
                    child: Center(
                        child: Text(
                      "x${count}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 9,
            letterSpacing: 0.35,
            fontWeight: FontWeight.w500,
            color: Color(0xFF898A8D),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onIncrement,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(6)),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.black,
                )),
              ),
            ),
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(6)),
                child: const Center(
                    child: Icon(
                  Icons.remove,
                  size: 18,
                  color: Colors.black,
                )),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
