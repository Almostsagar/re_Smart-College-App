import 'dart:async';

import 'package:finalapp/constant.dart';
import 'package:finalapp/pages/intro_screen.dart';
import 'package:finalapp/pages/onBoard/onboard.dart';
import 'package:finalapp/pages/user/usermain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sp1(),
    );
  }
}

class sp1 extends StatefulWidget {
  const sp1({Key? key}) : super(key: key);

  @override
  _sp1State createState() => _sp1State();
}

// ignore: camel_case_types
class _sp1State extends State<sp1> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyApp()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/icon/logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'College App',
              style: TextStyle(
                  fontFamily: 'Montserrat Regular',
                  color: Colors.white,
                  fontSize: 20.0),
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isviewed != 0 ? OnBoard() : Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: 'uid');
    if (value == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Checking for errors
          if (snapshot.hasError) {
            print('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Firebase auth',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            home: FutureBuilder(
              future: checkLoginStatus(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (snapshot.data == false) {
                  return IntroScreen();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    color: Colors.white,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return UserMain();
              },
            ),
          );
        });
  }
}
