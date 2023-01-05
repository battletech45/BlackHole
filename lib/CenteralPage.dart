import 'package:black_hole/src/helperFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'Leaderboard.dart';
import 'CoffeeListPage.dart';

class CentralPage extends StatefulWidget {

  @override
  _CentralPageState createState() => _CentralPageState();
}

class _CentralPageState extends State<CentralPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget showSelectedPage(int _selectedIndex) {
    if(_selectedIndex == 0) {
    }
    else if(_selectedIndex == 1) {
      return Leaderboard();
    }
    else if(_selectedIndex == 2) {
      return CoffeeListPage();
    }
    else if(_selectedIndex == 3) {
      return ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: showSelectedPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Image.asset('assets/home_grey.png', width: 24.0, height: 24.0),
            activeIcon: Image.asset('assets/home_indigo.png', width: 24.0, height: 24.0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/leader_gray.png', width: 24.0, height: 24.0),
            activeIcon: Image.asset('assets/leader_indigo.png', width: 24.0, height: 24.0),
            label: 'Leaderboard',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/menu_gray.png', width: 24.0, height: 24.0),
            activeIcon: Image.asset('assets/menu_indigo.png', width: 24.0, height: 24.0),
            label: 'Menu',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile_grey.png', width: 24.0, height: 24.0),
            activeIcon: Image.asset('assets/profile_indigo.png', width: 24.0, height: 24.0),
            label: 'Profile',
            backgroundColor: Colors.black,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
