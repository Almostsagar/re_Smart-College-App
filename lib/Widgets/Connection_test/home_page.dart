import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'connectivity_provider.dart';
import 'no_internet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivityProvider>(context, listen: false).startMonitoring();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageUI(),
    );
  }

  late bool _isOnline = true;
  Widget pageUI() {
    return Consumer<ConnectivityProvider>(
      builder: (consumerContext, model, child) {
        if (model.isOnline != null) {
          return model.isOnline ? MyApp() : NoInternet();
        }
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
