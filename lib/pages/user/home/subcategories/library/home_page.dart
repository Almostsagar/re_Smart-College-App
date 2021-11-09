import 'package:flutter/material.dart';

import 'add_student_page.dart';
import 'list_student_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SingleChildScrollView(child: ListStudentPage()),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudentPage(),
              ),
            )
          },
          child: Text('Add Books', style: TextStyle(fontSize: 20.0)),
          style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
        )
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       FlatButton(onPressed:
        //           () =>
        //       {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(
        //             builder: (context) => AddStudentPage(),
        //           ),
        //         )
        //       }
        //           , child: Text('Add')),
        //       ListStudentPage()
        //     ],
        //   ),
        // )
      ]),
    );
  }
}
