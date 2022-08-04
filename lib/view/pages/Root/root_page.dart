import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/pages/Cart/cart_page.dart';
import 'package:fusionpower/view/pages/Home/home_page.dart';
import 'package:fusionpower/view/pages/Profile/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, this.initialIndex = 0}) : super(key: key);
  final initialIndex;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  final items = [
    {
      'icon': Icons.home,
      'title': 'Home',
      'page': HomePage(),
    },
    {
      'icon': Icons.wallet,
      'title': 'Get Finance',
      'page': HomePage(),
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Cart',
      'page': CartPage(),
    },
    {
      'icon': Icons.person,
      'title': 'Account',
      'page': ProfilePage(),
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 4; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = i;
                  });
                },
                child: buildItem(i),
              )
          ],
        ),
      ),
      body: items[selectedIndex]['page'] as Widget,
    );
  }

  buildItem(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          items[index]['icon'] as IconData,
          color: selectedIndex == index ? primaryPurple : Colors.grey[500],
          size: selectedIndex == index ? 24 : 20,
        ),
        Text(
          items[index]['title'] as String,
          style: TextStyle(
            color: selectedIndex == index ? primaryPurple : Colors.grey[500],
            fontSize: selectedIndex == index ? 14 : 12,
            fontWeight:
                selectedIndex == index ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
