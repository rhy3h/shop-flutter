import 'package:flutter/material.dart';
import 'package:shop_flutter/components/custom_buttom_nav_bar.dart';
import 'package:shop_flutter/enum.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
