import 'package:flutter/material.dart';

class AppMainPage extends StatefulWidget {
  @override
  _AppMainPageState createState() => _AppMainPageState();
}

// The old _NavBarState class, just renamed.
class _AppMainPageState extends State<AppMainPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Search body layout'),
      ),
    ),

    Container(
      color: Colors.green,
      child: Center(
        child: Text('Favorites body layout'),
      ),
    ),

    //ForgetPassword(),
    Container(
      color: Colors.blue,
      child: Center(
        child: Text('Notification body layout'),
      ),
    ),

    //LoginScreen(),
    Container(
      color: Colors.amber,
      child: Center(
        child: Text('More body layout'),
      ),
    ),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Search',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorites',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: 'Notifications',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.more,
              ),
              label: 'More',
              backgroundColor: Colors.black),
        ],
        selectedItemColor: Color(0xffFFDA3A),
      ),
    );
  }
}
