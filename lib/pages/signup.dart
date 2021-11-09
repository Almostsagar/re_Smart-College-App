import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
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

  late bool _passwordVisible;
  late bool _passwordVisible2;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _passwordVisible = true;
    _passwordVisible2 = true;
  }

  Widget build(BuildContext context) {
    printFireBase();
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
          child: Center(
            child: Stack(children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 30.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'Cardo',
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
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
                                hintStyle: TextStyle(
                                    fontSize: 16.0, color: Colors.grey),
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
                                } else if (!value.contains('@giet.edu')) {
                                  return '⁉   Please Enter Valid Email of @giet.edu';
                                }
                                return null;
                              }),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            enableInteractiveSelection: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Cardo',
                            ),
                            cursorColor: Colors.grey,
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
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
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '❗   Please Enter Password';
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
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Cardo',
                            ),
                            cursorColor: Colors.grey,
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            obscureText: _passwordVisible2,
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible2 = !_passwordVisible2;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible2
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
                              hintText: 'Confirm your password',
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
                            controller: confirmPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '❓   Please Re-enter Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.characters,
                            enableInteractiveSelection: true,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Cardo',
                            ),
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_sharp,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.all(20),
                              hintText: 'Please Enter Student Name',
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
                            controller: studentNameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '⁉   Please Enter Student Name';
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
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Cardo',
                            ),
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.library_books_sharp,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.all(20),
                              hintText: 'Please Enter Your Branch Name',
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
                            controller: branchController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '📛   Please Enter Branch Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            enableInteractiveSelection: true,
                            textCapitalization: TextCapitalization.characters,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontFamily: 'Cardo',
                            ),
                            cursorColor: Colors.grey,
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.format_list_numbered_rounded,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.all(20),
                              hintText: 'Please Enter Your Roll no.',
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
                            controller: rollnoController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '🚫  Please Enter Roll No';
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
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: kBodyText,
                              ),
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
                                  child: const Text('Login',
                                      style: TextStyle(color: Colors.white)))
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
        ),
      ),
    );
  }
}
