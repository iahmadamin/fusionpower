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
        borderRadius: BorderRadius.circular(12),
        border: border
            ? Border.all(
                color: Color(0xFFC7C7CC),
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
                  top: 4,
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
                      style: TextStyle(color: Colors.white),
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
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
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
                height: 24,
                width: 24,
                color: Color(0xFF515151),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            ),
            GestureDetector(
              onTap: onDecrement,
              child: Container(
                height: 24,
                width: 24,
                color: Color(0xFF515151),
                child: Center(
                    child: Icon(
                  Icons.remove,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
