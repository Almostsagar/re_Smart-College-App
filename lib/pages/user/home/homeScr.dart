// ignore: file_names
// ignore_for_file: file_names
import 'package:finalapp/pages/user/home/subcategories/Library.dart';
import 'package:finalapp/pages/user/home/subcategories/NoticeBoard.dart';
import 'package:finalapp/pages/user/home/subcategories/attendence.dart';
import 'package:finalapp/pages/user/home/subcategories/feespayment.dart';
import 'package:finalapp/pages/user/home/subcategories/onlineNotes.dart';
import 'package:flutter/material.dart';

import '../profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cardTextStyle = const TextStyle(
        fontSize: 16.0,
        fontFamily: 'Trajan Pro',
        color: Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.252,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/top_header.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      primary: false,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profile()),
                            )
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/1.jpg',
                                  height: 128,
                                ),
                                Text(
                                  'Personal Data',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeesPayment()),
                            )
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/2.jpg',
                                    height: 128,
                                  ),
                                  Text(
                                    'Fees Payment',
                                    style: cardTextStyle,
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Library()),
                            )
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/3.jpg',
                                  height: 128,
                                ),
                                Text(
                                  'Library',
                                  style: cardTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnlineNotes()),
                            )
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/4.jpg',
                                    height: 128,
                                  ),
                                  Text(
                                    'Online notes',
                                    style: cardTextStyle,
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoticeBoard()),
                            )
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/5.png',
                                    height: 128,
                                  ),
                                  Text(
                                    'Notice Board',
                                    style: cardTextStyle,
                                  )
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AttendencePage()),
                            )
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/6.jpg',
                                    height: 128,
                                  ),
                                  Text(
                                    'Attendance',
                                    style: cardTextStyle,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
