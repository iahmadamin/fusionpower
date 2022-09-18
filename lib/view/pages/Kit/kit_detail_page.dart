import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/api_controller.dart';
import 'package:fusionpower/controllers/kit_controller.dart';
import 'package:fusionpower/view/pages/Kit/widgets/bill_widget.dart';
import 'package:fusionpower/view/pages/Kit/widgets/installation_add_on.dart';
import 'package:fusionpower/view/pages/Kit/widgets/installation_process.dart';
import 'package:fusionpower/view/pages/Kit/widgets/kit_price.dart';
import 'package:fusionpower/view/pages/Kit/widgets/quote_sticky_bottom.dart';
import 'package:fusionpower/view/pages/Kit/widgets/register_your_system.dart';
import 'package:fusionpower/view/pages/Kit/widgets/your_solar_system.dart';
import 'package:get/get.dart';

class KitDetail extends StatefulWidget {
  const KitDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<KitDetail> createState() => _KitDetailState();
}

class _KitDetailState extends State<KitDetail> {
  // int firstSolar = 1;
  // int secondSolar = 2;
  // int thirdSolar = 1;

  // late final Kit product;
  // List<WooCom> selectedWooComponents = [];
  final KitController kitController = Get.find();

  @override
  void initState() {
    super.initState();
    // kitController.updateProductModel();
    // product = widget.product;
    // log("Categories: ${product.categories}");
    // log("Woo Coomerce Components: ${product.wooComComponents}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryPurple,
          ),
        ),
        title: const Text(
          "Kit Details",
          style: TextStyle(
            color: labelColorPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<KitController>(
        builder: (controller) {
          final Kit product = controller.product!;
          for (var element in product.wooComComponents) {
            log("Default ProductId: ${element.defaultProductId}, ProductIds: ${element.productIds}");
          }
          return SizedBox.expand(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            child: Center(
                                child: Image.network(product.images.isEmpty
                                    ? 'https://fusionpower.co.za/wp-content/uploads/2021/06/SA-LSK-Per-1024x1024-1.jpeg'
                                    : product.images[0]["src"]))),
                        const SizedBox(
                          height: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 12),
                          child: Text(
                            product.name,
                            style: const TextStyle(
                                color: greyDark,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.38),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "Bundle Test Product",
                            style: TextStyle(
                              fontSize: 12,
                              letterSpacing: 0.38,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const KitPriceWidget(),
                        BillWidget(),
                        YourSolarSystemWidget(),
                        const InstalltionProcessWidget(),
                        InstallationAddonWidget(product: product),
                        const SizedBox(height: 4),
                        const RegisterYourSystemwidget(),
                        const SizedBox(height: 180),
                      ]),
                ),
                QuoteStickyBottomWidget(product: product),
              ],
            ),
          );
        },
      ),
    );
  }
}
