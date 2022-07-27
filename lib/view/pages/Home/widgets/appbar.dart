import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/view/pages/Cart/cart_page.dart';
import 'package:fusionpower/view/widgets/mini_button.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: greyDark),
      backgroundColor: backgroundColor,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MiniButton(
            onTap: () {},
            label: "(021) 012 5336",
            icon: Icons.call,
          ),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Get.to(() => CartPage());
            },
            child: SizedBox(
              height: 24,
              width: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset("assets/svgs/cart.svg")),
                  ),
                  Positioned(
                      right: 0,
                      top: 0,
                      child: GetBuilder(
                        init: CartController(),
                        builder: <CartController>(controller) {
                          return controller.cart.length > 0
                              ? CircleAvatar(
                                  radius: 6,
                                  backgroundColor: pastelGreen,
                                  child: Text(controller.cart.length.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 7,
                                          fontWeight: FontWeight.w600)),
                                )
                              : const SizedBox();
                        },
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
