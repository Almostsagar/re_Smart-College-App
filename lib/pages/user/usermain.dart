import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:finalapp/pages/user/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'change_password.dart';
import 'dashboard.dart';
import 'dashboard.dart';
import 'dashboard.dart';

class UserMain extends StatefulWidget {
  const UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  final storage = new FlutterSecureStorage();

  static final List<Widget> _widgetOptions = <Widget>[
    const Dashboard(),
    const profile(),
    const SettingPageUI(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff392850),
            elevation: 8,
            toolbarHeight: 60,
            title: const Text(
              'COLLEGE APP',
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 21),
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20)),
                // gradient: LinearGradient(
                //   colors: [Colors.purple,Colors.blue],
                //   begin: Alignment.bottomCenter,
                //   end: Alignment.topCenter
                // ),
                //
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: _onItemTapped,
            containerHeight: 70,
            animationDuration: const Duration(milliseconds: 150),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('DashBoard'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('My Profile'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.pink),
            ],
          )

        // BottomNavigationBar(
        //   backgroundColor: Colors.white70,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //     icon: Icon(Icons.home),
        //     label: 'DashBoard'
        //    ),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.person),
        //         label: 'My Profile'
        //    ),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.settings),
        //         label: 'Settings'
        //    ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.red,
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }
}
