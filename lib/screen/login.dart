import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:my_second_app/screen/bottom_screen/register.dart';
import 'package:my_second_app/screen/register.dart';

import 'Widget/bcontainer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  const SizedBox(height: 50),
                  const SizedBox(height: 20),
                  SizedBox(height: height * .055),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: Text('Back')),
        ],
      ),
    ));
  }
}
