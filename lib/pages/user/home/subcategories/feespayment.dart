// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'feespayment_catalog/Payment.dart';

class FeesPayment extends StatelessWidget {
  const FeesPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Stripe',
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: Payment(),
    );
  }
}
