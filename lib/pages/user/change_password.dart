import 'package:finalapp/pages/user/home/subcategories/aboutus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant.dart';
import '../login.dart';

class SettingPageUI extends StatefulWidget {
  const SettingPageUI({Key? key}) : super(key: key);

  @override
  _SettingPageUIState createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;
  final storage = new FlutterSecureStorage();

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              const SizedBox(
                height: 8,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.person,
                    color: Color(0xff392850),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Account ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(
                height: 30,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => changePass()),
                  )
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Change Account Password',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600])),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => aboutus()),
                  )
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About US',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600])),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Privacy and Security',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600])),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              buildAccountOption(context, 'Languages'),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Icon(
                    Icons.accessibility,
                    color: Color(0xff392850),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Accessibility',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
                ],
              ),
              const Divider(
                height: 30,
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              buildNotificationOption(
                  'Theme Dark', valNotify1, onChangeFunction1),
              buildNotificationOption(
                  'Account Active', valNotify2, onChangeFunction2),
              buildNotificationOption(
                  'Show App Notifications', valNotify3, onChangeFunction3),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff392850),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white),
                  ),
                  onPressed: () async => {
                    await FirebaseAuth.instance.signOut(),
                    await storage.delete(key: 'uid'),
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, a, b) => Login(),
                          transitionDuration: Duration(seconds: 1),
                        ),
                        (route) => false)
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0xff392850),
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Hindi'),
                    SizedBox(
                      height: 8,
                    ),
                    Text('English'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class changePass extends StatefulWidget {
  const changePass({Key? key}) : super(key: key);

  @override
  _changePassState createState() => _changePassState();
}

class _changePassState extends State<changePass> {
  final _formkey = GlobalKey<FormState>();
  var newPassword = '';
  final newPasswordController = TextEditingController();
  final storage = new FlutterSecureStorage();

  @override
  void dispose() {
    newPasswordController.dispose();
    super.dispose();
  }

  final currentuser = FirebaseAuth.instance.currentUser;

  changePassword() async {
    try {
      await currentuser?.updatePassword(newPassword);
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Your Password has been changed, Login Again!",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      );
    } catch (e) {}
  }

  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/images/back_arrow.svg',
            width: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: kBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: <Widget>[
            Form(
              key: _formkey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontFamily: 'Cardo',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        enableInteractiveSelection: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontFamily: 'Cardo',
                        ),
                        cursorColor: Colors.grey,
                        autofocus: false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.all(20),
                          hintText: 'Enter Your Password',
                          hintStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontFamily: 'Cardo',
                          ),
                          border: OutlineInputBorder(),
                          errorStyle: TextStyle(
                            color: Colors.red,
                            fontSize: 16.0,
                            fontFamily: 'Cardo',
                          ),
                        ),
                        controller: newPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                newPassword = newPasswordController.text;
                              });
                              changePassword();
                            }
                          },
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
                          child: const Text(
                            'Change Password',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.black87),
                          )),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    );
  }
}
