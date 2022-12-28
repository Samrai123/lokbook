import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_second_app/screen/bottom_screen/home.dart';
import 'package:my_second_app/screen/bottom_screen/login.dart';
import 'package:my_second_app/screen/bottom_screen/profile.dart';
import 'package:my_second_app/screen/bottom_screen/register.dart';

import 'login.dart';
import 'register.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  List<Widget> lstBottomScreen = [
    const HomeBottomScreen(),
    LoginScreen(),
    const ProfileScreen(),
    RegisterScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Dashboard')),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.app_registration), label: 'Register'),
        ],
        backgroundColor: Color.fromARGB(255, 255, 209, 41),
        selectedItemColor: Colors.redAccent,
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
