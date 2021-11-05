import 'package:finalapp/constant.dart';
import 'package:finalapp/pages/intro_screen.dart';
import 'package:finalapp/pages/signup.dart';
import 'package:finalapp/pages/user/usermain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';

import 'forgetpassword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  var password = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final storage = new FlutterSecureStorage();
  userLogin() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await storage.write(key: 'uid', value: userCredential.user?.uid);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => UserMain(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No User Found for that Email');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong Password Provided by the User');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password Provided by the User",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  late bool _passwordVisible;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IntroScreen()),
            );
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
          child: Form(
            key: _formkey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: ListView(
                children: [
                  Text(
                    'Login using Email ID',
                    style: TextStyle(
                      fontFamily: 'Cardo',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Welcome back you have been missed',
                    style: TextStyle(
                      fontFamily: 'Cardo',
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'Cardo',
                      ),
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                        ),
                        contentPadding: EdgeInsets.all(20),
                        hintText: 'Please Enter Your Email ID',
                        hintStyle:
                            TextStyle(fontSize: 16.0, color: Colors.grey),
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
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                          fontFamily: 'Cardo',
                        ),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '❌   Please Enter Email ID';
                        } else if (!value.contains('@')) {
                          return '⁉    Please Enter Valid Email ID';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontFamily: 'Cardo',
                      ),
                      cursorColor: Colors.grey,
                      autofocus: false,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                      obscureText: _passwordVisible,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '❗   Please Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          userLogin();
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        overlayColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => forgetPass()),
                      ),
                    },
                    child: const Text(
                      'Forget Password ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't Have an account? ",
                          style: kBodyText,
                        ),
                        TextButton(
                          onPressed: () => {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) => signUp(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                                (route) => false)
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
