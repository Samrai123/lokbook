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
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: GoogleFonts.comicNeue(
                    fontSize: 12, fontWeight: FontWeight.w900))
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.comicNeue(
                fontWeight: FontWeight.bold, fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _LoginButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromARGB(255, 48, 43, 35),
                Color.fromARGB(255, 12, 12, 12)
              ])),
      child: Text(
        'Login',
        style: GoogleFonts.comicNeue(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 9, 61, 113),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: GoogleFonts.comicNeue(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: GoogleFonts.comicNeue(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: GoogleFonts.comicNeue(
                  color: Color(0xfff79c4f),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        'LookBook',
        style: GoogleFonts.comicNeue(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 63, 39, 21)),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

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
                  _title(),
                  const SizedBox(height: 50),
                  _emailPasswordWidget(),
                  const SizedBox(height: 20),
                  _LoginButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {},
                      child: Text('Forgot Password ?',
                          style: GoogleFonts.comicNeue(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ),
                  //_divider(),
                  _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
