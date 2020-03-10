import 'package:flutter/material.dart';

Widget getNavbar() {
  return Row(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 80, right: 60),
        child: Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: 35,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 20, right: 40),
        child: Container(
          height: 2,
          width: 850,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 20),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          items: <String>['EN', 'HN', 'BN', 'DE'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
          value: 'EN',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          width: 1.5,
          height: 40,
          color: Colors.black54,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 20, right: 18),
        child: Icon(
          Icons.search,
          color: Colors.black54,
          size: 35,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          width: 1.5,
          height: 40,
          color: Colors.black54,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          '...',
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
