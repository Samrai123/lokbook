import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:my_second_app/screen/dashboard.dart';
import 'package:my_second_app/screen/forgetpass.dart';
import 'package:my_second_app/screen/login.dart';
import 'package:my_second_app/screen/register.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for class',
      initialRoute: '/dashboard',
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/forgetpass': (context) => ForgetPasswordScreen(),
      },
    ),
  );
}
