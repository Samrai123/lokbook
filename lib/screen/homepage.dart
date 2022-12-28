import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'login.dart';
import 'register.dart';
import 'searchpage.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomepageScreen(),
    LoginScreen(),
    //const ProfileScreen(),
    RegisterScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Register'),
        ],
        backgroundColor: Color.fromARGB(255, 48, 43, 35),
        selectedItemColor: Color.fromARGB(255, 237, 237, 237),
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
