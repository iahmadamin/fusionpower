import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:get/get.dart';

class InstalltionProcessWidget extends StatelessWidget {
  const InstalltionProcessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "The Installation Process",
          style: TextStyle(
              color: greyDark,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.38),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "We can help faciliate your solar installation",
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            color: Color(0xFF898A8D),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Stack(
          children: [
            Positioned(
                left: 16,
                child: Container(
                  width: 2,
                  height: 240,
                  color: Colors.grey[300],
                )),
            Column(
              children: [
                _ProcessTile(
                  count: "1",
                  title: "Order your kit",
                  subtitle: "You can order online or pay on a quote",
                ),
                _ProcessTile(
                  count: "2",
                  title: "Book your virtual site inspection",
                  subtitle: "We will check your property layout",
                ),
                _ProcessTile(
                  count: "3",
                  title: "Book your installation date",
                  subtitle:
                      "After the inspection feedback you can book your install date",
                ),
                _ProcessTile(
                  count: "4",
                  title: "Equipment will be delivered",
                  subtitle:
                      "Soon before or on the day your equipment will be delivered",
                ),
                _ProcessTile(
                  count: "5",
                  title: "Date of installation",
                  subtitle:
                      "Installation takes 2 - 3 days for solar, 1 day for load shedding",
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class _ProcessTile extends StatelessWidget {
  const _ProcessTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.count,
  }) : super(key: key);

  final String title, subtitle, count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: Color(0xFFecf5fa),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
                child: Text(
              count,
              style: TextStyle(
                color: Color(0xFF1f629e),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            )),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: greyDark,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.38),
              ),
              SizedBox(
                width: Get.width * 0.7,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
