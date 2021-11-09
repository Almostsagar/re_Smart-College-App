// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constant.dart';

class OnlineNotes extends StatefulWidget {
  @override
  _OnlineNotesState createState() => _OnlineNotesState();
}

class _OnlineNotesState extends State<OnlineNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
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
      ),
      body: const WebView(
        initialUrl: 'http://gietnotes.epizy.com/notes.php?i=1',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
