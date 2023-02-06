import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:my_second_app/screen/login.dart';
import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/register.dart';
import 'package:my_second_app/screen/splash_screen.dart';

var getAppRoutes = <String, WidgetBuilder>{
  LoginScreen.route: (context) => const LoginScreen(),
  ProfileScreen.route: (context) => const ProfileScreen(),
};