import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/widgets/mini_button.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late final TextEditingController _searchController;
  final double drawerDividerHeight = 22;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: Get.width * 0.6,
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 56, 42),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 26,
              child: TextField(
                cursorColor: greyDark,
                controller: _searchController,
                style: const TextStyle(fontSize: 10, color: greyDark),
                decoration: const InputDecoration(
                    hintText: "Search Products",
                    hintStyle: TextStyle(
                      color: Color(0xFFC7C7CC),
                      fontSize: 10,
                    ),
                    isDense: true,
                    prefixIconConstraints:
                        BoxConstraints(minWidth: 32, maxHeight: 32),
                    contentPadding: EdgeInsets.only(left: 12, bottom: 6),
                    prefixIcon: Icon(Icons.search, color: Color(0xFFE7E7E7)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                    )),
              ),
            ),
            const SizedBox(height: 16),
            MiniButton(
              onTap: () {},
              label: "(021) 012 5336",
              icon: Icons.call,
            ),
            const SizedBox(height: 8),
            MiniButton(
              onTap: () {},
              label: "(021) 012 5336",
              icon: Icons.call,
              color: greenCrayola,
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              _DrawerTile(
                label: "Solar Power Kits",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Load Shedding Kits",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Inverters",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Solar Batteries",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Solar Panels",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Heating and Cooling",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Guides",
                onTap: () {},
              ),
              Divider(
                height: drawerDividerHeight,
                color: const Color(0xFFE7E7E7),
              ),
              _DrawerTile(
                label: "Contact",
                onTap: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.38,
                color: greyDark),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            color: greyDark,
            size: 18,
          ),
        ]),
      ),
    );
  }
}
