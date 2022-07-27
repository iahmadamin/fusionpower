import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';

class MiniProductTile extends StatelessWidget {
  const MiniProductTile({
    Key? key,
    this.border = true,
  }) : super(key: key);

  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: 90,
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
        Image.asset('assets/images/solar.png'),
        const SizedBox(
          height: 6,
        ),
        Text(
          "600 KWh",
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            fontWeight: FontWeight.w700,
            color: greyDark,
          ),
        ),
        Text(
          "Monthly Prod.",
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
              onTap: () {},
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
              onTap: () {},
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
