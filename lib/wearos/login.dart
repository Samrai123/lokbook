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
import 'package:my_second_app/wearos/profile.dart';
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
        context, MaterialPageRoute(builder: (context) => ProfileWear()));
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
                title: const Text('LookBook'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 4),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            child: const Text('Login'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
