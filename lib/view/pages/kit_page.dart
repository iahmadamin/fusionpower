import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/models/kit_model.dart';
import 'package:fusionpower/view/pages/kit_detail_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class KitPage extends StatefulWidget {
  const KitPage({super.key});

  @override
  State<KitPage> createState() => _KitPageState();
}

class _KitPageState extends State<KitPage> {
  late final ApiController _apiController;
  late final KitController _kitController;

  @override
  void initState() {
    super.initState();
    _apiController = Get.put(ApiController());
    _kitController = Get.put(KitController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: greyDark,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Fusion Power",
          style: TextStyle(fontFamily: 'Purple Purse'),
        ),
      ),
      body: SizedBox.expand(
        child: GetBuilder<ApiController>(builder: (controller) {
          return controller.loading
              ? const Center(
                  child: CircularProgressIndicator(color: primaryPurple))
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 32),
                  itemCount: controller.kits.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final kit = _apiController.kits[index];
                    return KitTile(kit: kit);
                  });
        }),
      ),
    );
  }
}

class KitTile extends StatelessWidget {
  const KitTile({
    Key? key,
    required this.kit,
  }) : super(key: key);

  final Kit kit;

  @override
  Widget build(BuildContext context) {
    final imgUrl = kit.images.isEmpty
        ? 'https://fusionpower.co.za/wp-content/uploads/2021/06/SA-LSK-Per-1024x1024-1.jpeg'
        : kit.images[0]["src"];
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset(imgPath),
          Image.network(imgUrl),
          const SizedBox(
            height: 18,
          ),
          Text(
            kit.name, // "Hybrid Solar Power Kit",
            style: const TextStyle(
                color: greyDark,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.38),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            kit.kitType.title,
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w600,
              color: Color(0xFF898A8D),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Starting At",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  Text(
                    "19,000 PKR.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: greyDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 38,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Pay Monthly",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                  Text(
                    "19,000 PKR.",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: greyDark,
                    ),
                  ),
                  Text(
                    "60 Months @ 16% APR",
                    style: TextStyle(
                      fontSize: 10,
                      letterSpacing: 0.38,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF898A8D),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 28),
          CButton(
            label: "View Solution",
            onTap: () {
              final KitController kitController = Get.find();
              kitController.updateKit(kit);

              // log("WooComComponents Length: ${kit.wooComComponents.length}");
              kitController.updateWooComponents(kit.wooComComponents);
              Get.to(() => const KitDetail());
            },
            borderRadius: 12,
            fontSize: 12,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
