import 'package:flutter/material.dart';
import 'package:shop_flutter/components/default_button.dart';
import 'package:shop_flutter/constants.dart';
import 'package:shop_flutter/screens/sign_in/sign_in_screen.dart';
import 'package:shop_flutter/size_config.dart';

import '../components/splash_content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class SplashItem {
  String text;
  String image;

  SplashItem(this.text, this.image);
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<SplashItem> splashData = [
    SplashItem("Welcome to Tokoto, Let’s shop!", "assets/images/splash_1.png"),
    SplashItem(
        "We help people conect with store \naround United State of America",
        "assets/images/splash_2.png"),
    SplashItem(
      "We show the easy way to shop. \nJust stay at home with us",
      "assets/images/splash_3.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index].text,
                  image: splashData[index].image,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(
                          context,
                          SignInScreen.routeName,
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
