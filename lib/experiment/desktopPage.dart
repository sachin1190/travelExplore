import 'package:flutter/material.dart';

class DesktopPage extends StatelessWidget {
  final int data;

  DesktopPage({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Desktop page data is $data'),
      ),
    );
  }
}
