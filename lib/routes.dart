import 'package:flutter/widgets.dart';
import 'package:shop_flutter/screens/cart/cart_sceen.dart';
import 'package:shop_flutter/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_flutter/screens/details/details_screen.dart';
import 'package:shop_flutter/screens/forgot_password/forgot_password_screen.dart';
import 'package:shop_flutter/screens/home/home_screen.dart';
import 'package:shop_flutter/screens/login_success/login_success_screen.dart';
import 'package:shop_flutter/screens/otp/otp_screen.dart';
import 'package:shop_flutter/screens/profile/profile_screen.dart';
import 'package:shop_flutter/screens/sign_in/sign_in_screen.dart';
import 'package:shop_flutter/screens/sign_up/sign_up_screen.dart';
import 'package:shop_flutter/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OTPScreen.routeName: (context) => OTPScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
