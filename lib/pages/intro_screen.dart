import 'package:finalapp/constant.dart';
import 'package:finalapp/pages/login.dart';
import 'package:finalapp/pages/signup.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: kBackgroundColor),
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: new EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/team_illustration.png",
                        width: MediaQuery.of(context).size.width * 0.8,
                        fit: BoxFit.cover)),
                Text("Smart College App",
                    textAlign: TextAlign.center, style: kHeadline),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text("Stay Updated, Anytime Anywhere",
                      textAlign: TextAlign.center, style: kBodyText),
                ),
                SizedBox(
                  height: 100,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Sign In',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()));
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
