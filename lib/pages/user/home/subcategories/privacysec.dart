import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../constant.dart';

class privacy extends StatelessWidget {
  late var x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
      body:
      const WebView(
        initialUrl:
            'https://github.com/Almostsagar/re_Smart-Course-App/blob/master/privicy.md',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
      body: const WebView(
        initialUrl:
            'https://github.com/Almostsagar/re_Smart-Course-App/blob/master/security.md',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
