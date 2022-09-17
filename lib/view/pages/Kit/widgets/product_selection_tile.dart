import 'package:flutter/material.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/woo_com_model.dart';
import 'package:get/get.dart';

class ProductSelectionTile extends StatelessWidget {
  ProductSelectionTile({
    Key? key,
    required this.component,
    required this.index,
  }) : super(key: key);

  final WooCom component;
  final int index;
  final KitController kitController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: const Color(0xFFC7C7CC),
          )),
      child: Row(children: [
        SizedBox(
          height: 68,
          width: 56,
          child: Image.asset("assets/images/Fusion_battery-300x300.jpg"),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const Text(
              "Add option",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: Get.width * 0.45,
              child: Text(
                component.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "R 1234",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            kitController.updateSelectedWooComponents(index, component);
            Get.back();
          },
          child: Container(
              height: 32,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(
                  color: Colors.black,
                  width: 2.5,
                ),
              ),
              child: const Icon(Icons.add)),
        ),
        const SizedBox(width: 12),
      ]),
    );
  }
}
