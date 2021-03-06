import 'package:flutter/material.dart';
import 'package:shop_flutter/components/custom_buttom_nav_bar.dart';
import 'package:shop_flutter/enum.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
