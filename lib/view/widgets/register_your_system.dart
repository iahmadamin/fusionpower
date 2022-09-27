import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:get/get.dart';

import '../../controllers/kit_controller.dart';

class RegisterYourSystemwidget extends StatelessWidget {
  const RegisterYourSystemwidget({
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
        const Text(
          "Register your system",
          style: TextStyle(
              color: greyDark,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.38),
        ),
        const SizedBox(
          height: 2,
        ),
        const Text(
          "For City of Cape Town",
          style: TextStyle(
            fontSize: 12,
            letterSpacing: 0.38,
            color: Color(0xFF898A8D),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              width: 2,
              color: const Color(0xFFC7C7CC),
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "If you receive your bills from CoCT (City of Cape Town) you will need to register your system, our installer can do this for you at an additional fee.",
                    style: TextStyle(
                        fontSize: 14, color: Colors.black, height: 1.4),
                  ),
                  const SizedBox(height: 6),
                  RichText(
                    text: const TextSpan(
                      text: 'Only NRS Approved inverters ',
                      style: TextStyle(
                          fontSize: 14, color: Colors.red, height: 1.4),
                      children: <TextSpan>[
                        TextSpan(
                          text: '(our Hybrid inverters are NRS Approved), ',
                          style: TextStyle(
                              fontSize: 14, color: Colors.black, height: 1.4),
                        ),
                        TextSpan(
                          text:
                              'view the complete list.\n\nMore information here on the registration process.',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              color: Colors.black,
                              height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const DottedLine(
              dashColor: Color(0xFFC7C7CC),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(children: [
                const Text(
                  "R5,750",
                  style: TextStyle(
                      color: greyDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.38),
                ),
                const Text(
                  "Inc VAT",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Color(0xFF898A8D),
                  ),
                ),
                const SizedBox(height: 12),
                GetBuilder<KitController>(builder: (controller) {
                  return GestureDetector(
                      onTap: () {
                        controller.toggleRegistrationAddon();
                      },
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                            color: controller.registrationAddonSelected
                                ? primaryBlue
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                width: controller.registrationAddonSelected
                                    ? 0
                                    : 2,
                                color: const Color(0xFF434343))),
                        child: Center(
                          child: Text(
                            controller.registrationAddonSelected
                                ? "Remove Option"
                                : "Add Option",
                            style: TextStyle(
                              color: controller.registrationAddonSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                              letterSpacing: 0.38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ));
                }),
                const SizedBox(height: 8),
              ]),
            ),
          ]),
        ),
      ]),
    );
  }
}
