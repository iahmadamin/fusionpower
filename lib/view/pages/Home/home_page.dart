import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/sample_data.dart';
import 'package:fusionpower/view/pages/Product/product_detail_page.dart';
import 'package:fusionpower/view/widgets/appbar.dart';
import 'package:fusionpower/view/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = productList[0];

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HomeAppBar(),
      drawer: const HomeDrawer(),
      body: ProductDetail(product: product),
    );
  }
}
