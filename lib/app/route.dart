import 'package:flutter/cupertino.dart';
import 'package:my_second_app/screen/category/category_screen.dart';
import 'package:my_second_app/screen/auth1/login.dart';
import 'package:my_second_app/screen/homepage.dart';

import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/auth1/register.dart';
import 'package:my_second_app/screen/splash_screen.dart';
import 'package:my_second_app/wearos/login.dart';

import '../screen/visual/visual_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  LoginScreen.route: (context) => const LoginScreen(),
  ProfileScreen.route: (context) => const ProfileScreen(),
  CategoryVisualScreen.route: (context) => const CategoryVisualScreen(),
  SplashScreen.route: (context) => SplashScreen(
        title: "LookBook",
      ),
  VisualScreen.route: (context) => const VisualScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  RegisterScreen.route: (context) => const RegisterScreen(),
  LoginScreenWear.route: (context) => const LoginScreenWear()
};
