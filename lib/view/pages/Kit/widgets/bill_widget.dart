import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:get/get.dart';

class BillWidget extends StatelessWidget {
  BillWidget({
    Key? key,
  }) : super(key: key);

  final FocusNode focusNode = FocusNode();
  final TextEditingController billController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: GetBuilder<KitController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Size your System",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.38,
                          fontWeight: FontWeight.w700,
                          color: greyDark,
                        ),
                      ),
                      Text(
                        "Enter your Highest Montly Bill",
                        style: TextStyle(
                          fontSize: 10,
                          letterSpacing: 0.38,
                          color: Color(0xFF898A8D),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (controller.showBillResult)
                    Column(
                      children: [
                        const Text(
                          "You use",
                          style: TextStyle(fontSize: 12, color: greyDark),
                        ),
                        Text(
                          ("${controller.bill} kWh"),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const Text(
                          "per month",
                          style: TextStyle(fontSize: 12, color: greyDark),
                        )
                      ],
                    )
                ],
              ),
              const SizedBox(height: 8),
              Container(
                  height: 50,
                  width: Get.width * 0.855,
                  padding: const EdgeInsets.only(right: 8, left: 24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                          width: 2, color: Colors.grey.withOpacity(0.5))),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          //controller: billController,
                          focusNode: focusNode,
                          onChanged: (val) {
                            if (val.isEmpty) {
                              controller.updateBill(0);
                            } else {
                              controller.updateBill(int.parse(val));
                            }
                          },
                          cursorColor: greyDark,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: greyDark),
                          decoration: const InputDecoration(
                              hintText: "Enter Bill",
                              hintStyle: TextStyle(
                                  color: Color(0xFFadc2d4),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic),
                              // isDense: true,
                              // prefixIconConstraints:
                              //     BoxConstraints(
                              //         minWidth: 32,
                              //         maxHeight: 32),
                              // contentPadding:
                              //     EdgeInsets.only(
                              //         left: 0, bottom: 6),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                          onTap: controller.bill >= 6000
                              ? () {
                                  controller.enableShowBillResult();
                                  focusNode.unfocus();
                                }
                              : () {},
                          child: Container(
                            height: 38,
                            width: 112,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: controller.bill >= 6000
                                  ? primaryBlue
                                  : const Color(0xFFadc2d4),
                            ),
                            child: const Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
              const SizedBox(height: 12),
              if (controller.showBillResult)
                Column(
                  children: [
                    const Text(
                      "When do you use the most power?",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.38,
                        fontWeight: FontWeight.w700,
                        color: greyDark,
                      ),
                    ),
                    const Text(
                      "Sunrise is 8am, Sunset is 6pm",
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 0.38,
                        color: Color(0xFF898A8D),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "${(controller.energyOffset * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Text(
                              "Day",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SliderTheme(
                            data: const SliderThemeData(
                              activeTickMarkColor: Colors.transparent,
                              inactiveTickMarkColor: Colors.transparent,
                              disabledActiveTickMarkColor: Colors.transparent,
                              disabledInactiveTickMarkColor: Colors.transparent,
                              inactiveTrackColor: Colors.white,
                            ),
                            child: Slider(
                              onChanged: (double value) {
                                controller.updateEneryOffset(value);
                              },
                              value: controller.energyOffset,
                              divisions: 10,
                              thumbColor: Colors.white,
                              activeColor: const Color(0xFFf6ab54),
                              inactiveColor: const Color(0xFFf1b61aa),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              "${(100 - controller.energyOffset * 100).toStringAsFixed(0)}%",
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const Text(
                              "Night",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  width: 1.5,
                                  color: const Color(0xFFf6ab54),
                                )),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${(controller.energyOffset * 26).toStringAsFixed(0)} kWh",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "Day usage",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Container(
                            height: 68,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  width: 1.5,
                                  color: const Color(0xFFf1b61aa),
                                )),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${((1 - controller.energyOffset) * 26).toStringAsFixed(0)} kWh",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "Night usage",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ],
                    ),

                    /// Energy Offset info Widget (Website)
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Text(
                    //       "Your Energy Offset",
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         letterSpacing: 0.38,
                    //         fontWeight: FontWeight.w700,
                    //         color: greyDark,
                    //       ),
                    //     ),
                    //     const Text(
                    //       "An estimation of your production and saving",
                    //       style: TextStyle(
                    //         fontSize: 10,
                    //         letterSpacing: 0.38,
                    //         color: Color(0xFF898A8D),
                    //       ),
                    //     ),
                    //     const SizedBox(height: 12),
                    //     Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Column(
                    //           children: [
                    //             const Text(
                    //               "83%",
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w800,
                    //                 fontSize: 18,
                    //               ),
                    //             ),
                    //             const Text(
                    //               "Est. Self-Powered\nAnnualy",
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 fontSize: 10,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Column(
                    //           children: [
                    //             const Text(
                    //               "67%",
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w800,
                    //                 fontSize: 18,
                    //               ),
                    //             ),
                    //             const Text(
                    //               "Est. Annual Bill\nSavings",
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 fontSize: 10,
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //         Column(
                    //           children: [
                    //             const Text(
                    //               "13hrs",
                    //               style: TextStyle(
                    //                 fontWeight: FontWeight.w800,
                    //                 fontSize: 18,
                    //               ),
                    //             ),
                    //             const Text(
                    //               "Avg. Daily Battery\nBackup",
                    //               textAlign: TextAlign.center,
                    //               style: TextStyle(
                    //                 fontSize: 10,
                    //               ),
                    //             )
                    //           ],
                    //         )
                    //       ],
                    //     ),
                    //     const SizedBox(height: 12),
                    //     Container(
                    //       width: double.infinity,
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 14, vertical: 18),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(6),
                    //         color: Colors.grey[200],
                    //       ),
                    //       child: const Text(
                    //         "This is based on using only solar and battery\nThis doesn't account for any increased months",
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //             color: greyDark,
                    //             fontSize: 12,
                    //             letterSpacing: 0.38),
                    //       ),
                    //     ),
                    //     const SizedBox(height: 12),
                    //   ],
                    // )
                  ],
                ),
              if (!controller.showBillResult)
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: productDataBGColor,
                  ),
                  child: Column(children: const [
                    Text(
                      "Let's Get Started",
                      style: TextStyle(
                          color: greyDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.38),
                    ),
                    Text(
                      "Submit your bill to get the ball rolling",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          letterSpacing: 0.38),
                    ),
                  ]),
                ),
            ],
          );
        },
      ),
    );
  }
}
