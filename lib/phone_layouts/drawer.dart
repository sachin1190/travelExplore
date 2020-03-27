import 'package:flutter/material.dart';
import 'package:travel_ui/trips.dart';
import 'package:travel_ui/main.dart';
import 'package:travel_ui/tripDetailsPage.dart';

const kTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'JosefinSans');

class DrawerPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Trip Planner',
              style: kTextStyle,
            ),
            decoration: BoxDecoration(color: Colors.orange.shade400),
            curve: Curves.bounceIn,
          ),
          getDrawer(context),
        ],
      ),
    );
  }
}

Widget getDrawer(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
        title: Text(
          'Home',
          style: kTextStyle,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        },
        trailing: Icon(
          Icons.home,
          color: Colors.orange,
        ),
      ),
      ListTile(
        title: Text(
          'Trips',
          style: kTextStyle,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TripPage(),
            ),
          );
        },
        trailing: Icon(
          Icons.card_travel,
          color: Colors.orange,
        ),
      ),
      ListTile(
        title: Text(
          'About us',
          style: kTextStyle,
        ),
        onTap: () {},
        trailing: Icon(
          Icons.info_outline,
          color: Colors.orange,
        ),
      ),
    ],
  );
}
