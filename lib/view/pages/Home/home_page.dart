import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Home/widgets/appbar.dart';
import 'package:fusionpower/view/pages/Home/widgets/drawer.dart';
import 'package:fusionpower/view/pages/Product/product_detail_page.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final controller = Get.put(CartController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final product = productList[0];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HomeAppBar(),
      drawer: const HomeDrawer(),
      body: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        crossAxisCount: 2,
        childAspectRatio: 0.58,
        children: [
          for (var i = 0; i < 12; i++) const ProductMiniTile(),
        ],
      ),
    );
  }
}

class ProductMiniTile extends StatelessWidget {
  const ProductMiniTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: Get.width * 0.4,
              child: Image.asset('assets/images/p1.png')),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Hybrid Solar Power Kit",
            style: TextStyle(
                color: greyDark, fontSize: 12, fontWeight: FontWeight.w700),
          ),
          const Text(
            "Bundle Test Product",
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w600,
              color: Color(0xFF898A8D),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Starting At",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w600,
              color: Color(0xFF898A8D),
            ),
          ),
          const Text(
            "19,000 PKR.",
            style: TextStyle(
              fontSize: 14,
              letterSpacing: 0.38,
              fontWeight: FontWeight.w700,
              color: greyDark,
            ),
          ),
          const SizedBox(height: 8),
          CButton(
            label: "View Solution",
            onTap: () {
              Get.to(() => ProductDetail(product: productList[0]));
            },
            borderRadius: 22,
            fontSize: 12,
            height: 36,
            width: 126,
            color: const Color(0xFF979797),
          )
        ],
      ),
    );
  }
}
