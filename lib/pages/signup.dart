import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

// ignore: camel_case_types
class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

// ignore: camel_case_types
class _signUpState extends State<signUp> {
  final Future<FirebaseApp> _future = Firebase.initializeApp();
  final _formkey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  var confirmPassword = "";
  var branchName = FirebaseDatabase.instance.reference();
  var rollNo = FirebaseDatabase.instance.reference();
  var studentName = FirebaseDatabase.instance.reference();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final branchController = TextEditingController();
  final rollnoController = TextEditingController();
  final studentNameController = TextEditingController();
  void printFireBase() {
    branchName.child('branch').once().then((DataSnapshot snapshot) {
      print('Data: ${snapshot.value}');
    });
  }

  void addData(String bra) {
    branchName
        .child('branch')
        .push()
        .set({'Branch Name': bra, 'comment': 'This is Branch'});
  }

  void printFireBase1() {
    rollNo.child('rollno').once().then((DataSnapshot snapshot) {
      print('Data: ${snapshot.value}');
    });
  }

  void addData1(String roll) {
    rollNo
        .child('rollno')
        .push()
        .set({'Roll No': roll, 'comment': 'This is Roll no'});
  }

  void printFireBase2() {
    studentName.child('studName').once().then((DataSnapshot snapshot) {
      print('Data: ${snapshot.value}');
    });
  }

  void addData2(String studName) {
    studentName
        .child('studName')
        .push()
        .set({'Student Name': studName, 'comment': 'This is student name'});
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Registered Successfully, Please Login....",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Password provided is too weak',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                'Account Already Exists',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          );
        }
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Password and confirm password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    printFireBase();
    return Scaffold(
      appBar: AppBar(
        title: const Text('User SignUp'),
      ),
      body: Center(
        child: Stack(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(left: 40.0, top: 40),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'Cardo',
                fontSize: 35,
                color: Color(0xff0C2551),
                fontWeight: FontWeight.w900,
              ),
            ),
            //
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            labelText: 'Email: ',
                            labelStyle: TextStyle(fontSize: 20.0),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                          ),
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            } else if (!value.contains('@')) {
                              return 'Please Enter Valid Email';
                            }
                            return null;
                          }),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Enter Student Name: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: studentNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Branch Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Enter Branch Name: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: branchController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Branch Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: const InputDecoration(
                          labelText: 'Roll No: ',
                          labelStyle: TextStyle(fontSize: 20.0),
                          border: OutlineInputBorder(),
                          errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                        controller: rollnoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Roll No';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addData(branchController.text);
                              addData1(rollnoController.text);
                              addData2(studentNameController.text);
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                  password = passwordController.text;
                                  confirmPassword = passwordController.text;
                                });
                                registration();
                              }
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          TextButton(
                              onPressed: () => {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation1,
                                          animation2) =>
                                          Login(),
                                      transitionDuration:
                                      Duration(seconds: 0)),
                                )
                              },
                              child: const Text('Login'))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
