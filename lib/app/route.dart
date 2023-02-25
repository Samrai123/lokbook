import 'package:flutter/cupertino.dart';
import 'package:my_second_app/screen/category_screen.dart';
import 'package:my_second_app/screen/login.dart';
import 'package:my_second_app/screen/notification.dart';
import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/register.dart';
import 'package:my_second_app/screen/splash_screen.dart';

import '../screen/visual_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  LoginScreen.route: (context) => const LoginScreen(),
  ProfileScreen.route: (context) => const ProfileScreen(),
  CategoryVisualScreen.route: (context) => const CategoryVisualScreen(),
  SplashScreen.route: (context) => SplashScreen(
        title: 'LookBook',
      ),
  VisualScreen.route: (context) => const VisualScreen(),
  NotificationScreen.route: (context) => const NotificationScreen(),
};
