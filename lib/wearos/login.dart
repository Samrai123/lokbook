import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_second_app/repository/user_repo.dart';
import 'package:my_second_app/screen/Widget/theme_helper.dart';
import 'package:my_second_app/screen/dashboard.dart';
import 'package:my_second_app/screen/homepage.dart';
import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/Widget/snackbar.dart';
import 'package:my_second_app/screen/auth1/register.dart';
import 'package:wear/wear.dart';

class LoginScreenWear extends StatefulWidget {
  const LoginScreenWear({Key? key}) : super(key: key);
  static const String route = "loginScreenWear";

  @override
  _LoginScreenWearState createState() => _LoginScreenWearState();
}

class _LoginScreenWearState extends State<LoginScreenWear> {
  double _headerHeight = 250;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController(text: 'samrai');
  final _passwordController = TextEditingController(text: 'samrai123');

  _login() async {
    final islogin = await UserRepositoryImpl()
        .loginUser(_usernameController.text, _passwordController.text);
    if (islogin) {
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()));
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: ((context, shape, child) {
        return AmbientMode(
          builder: ((context, mode, child) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * .2,
                title: const Text('Login'),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Container(
                    //   height: 150,
                    //   child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
                    // ),
                    SafeArea(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          margin: const EdgeInsets.fromLTRB(
                              20, 10, 20, 10), // This will be the login form
                          child: Column(
                            children: [
                              const SizedBox(height: 5.0),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                        child: TextFormField(
                                          decoration: ThemeHelper()
                                              .textInputDecoration('User Name',
                                                  'Enter your user name'),
                                          controller: _usernameController,
                                          onSaved: (newValue) {
                                            setState(() {
                                              _usernameController.text =
                                                  newValue!;
                                            });
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter username';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Container(
                                        decoration: ThemeHelper()
                                            .inputBoxDecorationShaddow(),
                                        child: TextFormField(
                                          obscureText: true,
                                          decoration: ThemeHelper()
                                              .textInputDecoration('Password',
                                                  'Enter your password'),
                                          controller: _passwordController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please enter password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      Container(
                                        decoration: ThemeHelper()
                                            .buttonBoxDecoration(context),
                                        child: ElevatedButton(
                                          style: ThemeHelper().buttonStyle(),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 10, 5, 10),
                                            child: Text(
                                              'Sign In'.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _login();
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
