import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/models/product_model.dart';
import 'package:fusionpower/sample_data.dart';

class InstallationAddonWidget extends StatelessWidget {
  const InstallationAddonWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 2, 12, 12),
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Need Installation?",
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
            "Use our chosen contractors",
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.38,
              color: Color(0xFF898A8D),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Areas Available:",
            style: TextStyle(
                color: greyDark,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.38),
          ),
          const SizedBox(height: 6),
          for (var location in areas) _AreaTile(location: location),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 2,
                color: const Color(0xFFC7C7CC),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Installation Contractor:",
                          style: TextStyle(
                              color: greyDark,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.38),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "Qualified Electrician Solar Installer",
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.38,
                            color: Color(0xFF898A8D),
                          ),
                        ),
                        const SizedBox(height: 6),
                        for (var title in contractors)
                          _ContractorTile(title: title),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const DottedLine(
                    dashColor: Color(0xFFC7C7CC),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Column(children: [
                      Text(
                        "R${product.price}",
                        style: const TextStyle(
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
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                    width: 2, color: const Color(0xFF434343))),
                            child: const Center(
                              child: Text(
                                "Add Option",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  letterSpacing: 0.38,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(height: 8),
                    ]),
                  ),
                ]),
          ),
          const SizedBox(height: 14),
          const InstallationProcedureTile(),
        ],
      ),
    );
  }
}

class _AreaTile extends StatelessWidget {
  const _AreaTile({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(children: [
        const Icon(
          Icons.location_on_outlined,
          size: 14,
          color: greenCrayola,
        ),
        const SizedBox(width: 10),
        Text(
          location,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        )
      ]),
    );
  }
}

class _ContractorTile extends StatelessWidget {
  const _ContractorTile({
    Key? key,
    this.title,
    this.textWidget,
  }) : super(key: key);

  final String? title;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: CircleAvatar(
            radius: 2.5,
            backgroundColor: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: textWidget ??
              Text(
                title!,
                maxLines: 4,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
        )
      ]),
    );
  }
}

class InstallationProcedureTile extends StatefulWidget {
  const InstallationProcedureTile({Key? key}) : super(key: key);

  @override
  State<InstallationProcedureTile> createState() =>
      _InstallationProcedureTileState();
}

class _InstallationProcedureTileState extends State<InstallationProcedureTile> {
  bool expanded = false;

  final List<String> procedures = [
    "The installation of kit only",
    "A COC Electrician certificate",
    "Workmanship Guarantee",
    "Booking Management",
    "Cover basic Fault Support",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xFFf8f8f8)),
          child: GestureDetector(
            onTap: () {
              print("installation procedure");
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Installation Procedure",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                AnimatedRotation(
                    turns: expanded ? 0.5 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(Icons.keyboard_arrow_down)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          duration: const Duration(milliseconds: 400),
          child: expanded
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  RichText(
                    text: const TextSpan(
                      text: 'The chosen sub-contractor ',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'will install the Solar Power kit, it includes:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  for (final procedure in procedures)
                    _ContractorTile(title: procedure),
                  const SizedBox(height: 12),
                  const Text(
                    'Please Note:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  const _ContractorTile(
                    title:
                        "Only includes AC wiring to the main distribution board, any additional boards to be wired to will be custom quoted upon site inspection.",
                  ),
                  _ContractorTile(
                    textWidget: RichText(
                      text: const TextSpan(
                        text:
                            'Any issues with the installation falls with the sub-contractor ',
                        style: TextStyle(
                            fontSize: 14, color: Colors.red, height: 1.4),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'and not Solar Advice',
                            style: TextStyle(
                                fontSize: 14, color: Colors.black, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _ContractorTile(
                    textWidget: RichText(
                      text: const TextSpan(
                        text:
                            'Any damage or issues falls with the sub-contractor  ',
                        style: TextStyle(
                            fontSize: 14, color: Colors.red, height: 1.4),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'and not Solar Advice, we (Solar Advice) simply assist with equipment and product support.',
                            style: TextStyle(
                                fontSize: 14, color: Colors.black, height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _ContractorTile(
                    textWidget: RichText(
                      text: const TextSpan(
                        text:
                            'For Cape Town installations under CoCT you can   ',
                        style: TextStyle(
                            fontSize: 14, color: Colors.black, height: 1.4),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'only install Hybrid Solar Power Kits.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const _ContractorTile(
                    title: "Subject to site inspection.",
                  ),
                  const _ContractorTile(
                    title: "Excludes any pre-existing electrical issues",
                  ),
                ])
              : Container(),
        ),
      ],
    );
  }
}
