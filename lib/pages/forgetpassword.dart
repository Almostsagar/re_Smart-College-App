import 'package:finalapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import 'login.dart';

class forgetPass extends StatefulWidget {
  const forgetPass({Key? key}) : super(key: key);

  @override
  _forgetPassState createState() => _forgetPassState();
}

class _forgetPassState extends State<forgetPass> {
  final _formkey = GlobalKey<FormState>();

  var email = "";
  final emailController = TextEditingController();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Password reset email has been sent",
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
              MaterialPageRoute(builder: (context) => Login()),
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontFamily: 'Cardo',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: const Text(
                  'Reset link will be sent to your email id !',
                  style: TextStyle(
                    fontFamily: 'Cardo',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                  child: Form(
                key: _formkey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          enableInteractiveSelection: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.0,
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
                              return '❌   Please Enter Email';
                            } else if (!value.contains('@giet.edu')) {
                              return '⁉    Please Enter Valid Email of @giet.edu';
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
                              });
                              resetPassword();
                            }
                          },
                          child: const Text(
                            'Send Email',
                            style: TextStyle(
                                color: Colors.black87, fontSize: 18.0),
                          ),
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
                        ),
                      ),
                      Container(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, a, b) => Login(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                                (route) => false);
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
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
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
