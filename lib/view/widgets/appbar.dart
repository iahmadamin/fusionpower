import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/widgets/mini_button.dart';

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
            onTap: () {},
            child: SvgPicture.asset("assets/svgs/cart.svg"),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
