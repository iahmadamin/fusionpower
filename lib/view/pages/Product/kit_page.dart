import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/widgets/appbar.dart';
import 'package:fusionpower/view/widgets/drawer.dart';

class KitPage extends StatelessWidget {
  const KitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: const HomeAppBar(),
      drawer: const HomeDrawer(),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(children: [
              const Text(
                "Solar Power Kits",
                style: TextStyle(
                    color: greyDark,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.38),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
