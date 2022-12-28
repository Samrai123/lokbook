import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'homepage.dart';
import 'login.dart';
import 'register.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 48, 43, 35),
      ),
      body: Container(
        child: Row(children: [
          // Card(
          //   color: Color.fromARGB(255, 184, 179, 173),
          //   clipBehavior: Clip.hardEdge,
          //   child: InkWell(
          //     splashColor: Colors.blue.withAlpha(30),
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => LoginScreen()));
          //     },
          //     child: const SizedBox(
          //       width: 75,
          //       height: 75,
          //       child: Text(
          //         'Login',
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 50,
            width: 50,
          ),
          Card(
            color: Color.fromARGB(255, 184, 179, 173),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Container(
                width: 75,
                height: 75,
                child: Text(
                  'Register',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Card(
          //   color: Color.fromARGB(255, 184, 179, 173),
          //   clipBehavior: Clip.hardEdge,
          //   child: InkWell(
          //     splashColor: Colors.blue.withAlpha(30),
          //     onTap: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => HomepageScreen()));
          //     },
          //     child: Container(
          //       width: 75,
          //       height: 75,
          //       child: Text(
          //         'Homepage',
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
