import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:my_second_app/screen/login.dart';
import 'package:my_second_app/screen/register.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter for class',
      initialRoute: '/register',
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen()
      },
    ),
  );
}
