import 'package:flutter/material.dart';

class PhonePage extends StatelessWidget {
  final int data;

  PhonePage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mobile page data is $data'),
      ),
    );
  }
}
