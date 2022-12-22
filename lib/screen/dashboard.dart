import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          Card(
            color: Color.fromARGB(255, 48, 43, 35),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 150,
                height: 150,
                child: Text(
                  'Login',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
            width: 50,
          ),
          Card(
            color: Color.fromARGB(255, 48, 43, 35),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 150,
                height: 150,
                child: Text('Register'),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
