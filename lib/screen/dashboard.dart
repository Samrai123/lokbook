import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/app/user_permisson.dart';
import 'package:my_second_app/screen/homepage.dart';
import 'package:my_second_app/screen/post_screen.dart';
import 'package:my_second_app/screen/profile_screen.dart';
import 'package:my_second_app/screen/search_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const String route = "dashboardScreen";

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    debugPrint(Constant.token);
    checkPermission();
  }

  // void show() {
  //   showSnackbar(context, 'Token : ${Constant.token}', Colors.yellow);
  // }

  checkPermission() async {
    await UserPermission.checkCameraPermission();
  }

  int _selectedIndex = 0;
  final List<Widget> _lstScreen = [
    const HomeScreen(),
    const PostScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lstScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_sharp,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 136, 128, 128),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
