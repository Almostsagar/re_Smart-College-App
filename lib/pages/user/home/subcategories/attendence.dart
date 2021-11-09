import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constant.dart';

class AttendencePage extends StatefulWidget {
  const AttendencePage({Key? key}) : super(key: key);

  @override
  _AttendencePageState createState() => _AttendencePageState();
}

class _AttendencePageState extends State<AttendencePage> {
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
        initialUrl: 'https://www.gandhionline.in/BEESERP/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
