import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/pages/Profile/edit_profile.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryPurple,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          "My Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              size: 18,
              color: greyDark,
            ),
            onPressed: () {
              Get.to(() => const EditProfilePage());
            },
          ),
        ],
      ),
      body: Column(children: [
        CircleAvatar(
          radius: 52,
          backgroundImage: AssetImage('assets/images/user.png'),
        ),
        const SizedBox(height: 12),
        Text(
          "Wassi Ahsan",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: labelColorPrimary,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        _ProfileTile(
          title: "My Profile",
          icon: Icons.person_outline,
          onTap: () {},
        ),
        _ProfileTile(
          title: "My Address",
          icon: Icons.location_on_outlined,
          onTap: () {},
        ),
        _ProfileTile(
          title: "Notifications",
          icon: Icons.notifications_none_outlined,
          onTap: () {},
        ),
        _ProfileTile(
          title: "Logout",
          icon: Icons.arrow_forward_ios,
          onTap: () {},
        ),
      ]),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Color(0xFFDEF5F7),
                borderRadius: BorderRadius.circular(8)),
            child: Icon(
              icon,
              color: Color(0xFF63CEDA),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: labelColorPrimary,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ]),
      ),
    );
  }
}
