// ignore: file_names
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OnlineNotes extends StatefulWidget {
  const OnlineNotes({Key? key}) : super(key: key);

  @override
  _OnlineNotesState createState() => _OnlineNotesState();
}

class _OnlineNotesState extends State<OnlineNotes> {
  String _title = 'Welcome India';
  List<String> menuItems = [
    'India',
    'Australia',
    'England',
    'Amreeka',
    'Russia'
  ];
  String _selectedIndex = 'India';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          // toolbarHeight: 10,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.green,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30.0),
            const Text(
              'Select Country and Display',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30.0),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: false,
                  underline: const SizedBox(
                    height: 10,
                  ),
                  elevation: 10,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                  ),
                  hint: Text('Select Country'),
                  value: _selectedIndex,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIndex = value!;
                      _title = 'Welcome $value';
                    });
                  },
                  items: menuItems.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 30.0),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: false,
                  underline: const SizedBox(
                    height: 10,
                  ),
                  elevation: 10,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                  ),
                  hint: Text('Select Country'),
                  value: _selectedIndex,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIndex = value!;
                      _title = 'Welcome $value';
                    });
                  },
                  items: menuItems.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 30.0),
            Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: false,
                  underline: const SizedBox(
                    height: 10,
                  ),
                  elevation: 10,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                  ),
                  hint: Text('Select Country'),
                  value: _selectedIndex,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedIndex = value!;
                      _title = 'Welcome $value';
                    });
                  },
                  items: menuItems.map((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                )),
            const SizedBox(height: 30.0),
            Container(
              child: Text(this._title),
            )
          ],
        ),
      ),
    );
  }
}

// late String selectedName;
// List data = [];
// Future getAllName() async{
//   var response = await http.get("",headers:{"accept":"application/json"});
//   var jsonBody = response.body;
//   var jsonData = json.decode(jsonBody);
//   setState(() {
//     data = jsonBody as List;
//   });
//   print(jsonData);
//
// }

// @override
// void initState() {
//   super.initState();
//   getAllName();
// }
