import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/controllers/cart_controller.dart';
import 'package:fusionpower/view/widgets/c_button.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: GetBuilder<CartController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(children: [
                for (var i = 0; i < controller.cart.length; i++)
                  CartItem(
                    name: controller.cart[i].title,
                    imgPath: controller.cart[i].imagePath,
                    price: controller.cart[i].price,
                    onTap: () {
                      controller.removeItem(controller.cart[i]);
                    },
                  ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        cursorColor: greyDark,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          hintText: "Coupon Code",
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFC7C7CC),
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 11),
                    CButton(
                      label: "Coupon Code",
                      onTap: () {},
                      color: const Color(0xFF898A8D),
                      borderRadius: 12,
                      height: 46,
                      width: 120,
                      fontSize: 12,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE7E7E7))),
                    child: const Center(
                        child: Text(
                      "Update Cart",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF898A8D),
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                Container(
                  height: 46,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE7E7E7))),
                  child: Row(children: [
                    const Text(
                      "Subtotal",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF898A8D),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "${controller.subTotalPrice} PKR.",
                      style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF434343),
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 62,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFE7E7E7))),
                  child: Row(children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF898A8D),
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "${controller.totalPrice} PKR.",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF434343),
                          fontWeight: FontWeight.w700),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 26,
                ),
                CButton(
                  label: "Proceed to Checkout",
                  onTap: () {
                    controller.incrementcurrentStep();
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  },
                  fontSize: 12,
                  borderRadius: 12,
                ),
                const SizedBox(
                  height: 32,
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.name,
    required this.price,
    required this.imgPath,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final int price;
  final String imgPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: Get.width,
      margin: const EdgeInsets.fromLTRB(4, 8, 8, 6),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: const Text(
              'X',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(imgPath),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
                color: Color(0xFF434343),
                fontSize: 12,
                letterSpacing: 0.38,
                fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            price.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              letterSpacing: 0.38,
            ),
          )
        ],
      ),
    );
  }
}
