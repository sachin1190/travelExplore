import 'package:flutter/material.dart';
import 'extensions/hover.dart';
import 'trips.dart';

enum opts { Trips, AboutUs }

Widget getNavbar(BuildContext context) {
  return Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 26.28,
            left: MediaQuery.of(context).size.width / 17.075,
            right: MediaQuery.of(context).size.width / 22.76),
        child: Icon(
          Icons.ac_unit,
          color: Colors.white,
          size: MediaQuery.of(context).size.width / 39.02,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 33,
            right: MediaQuery.of(context).size.width / 34.15),
        child: Container(
          height: MediaQuery.of(context).size.height / 328.5,
          width: MediaQuery.of(context).size.width / 1.607,
          color: Colors.white,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 43.8,
            right: MediaQuery.of(context).size.width / 68.3),
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
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 43.8),
        child: Container(
          width: 1.5,
          height: 40,
          color: Colors.black54,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 75.88,
            top: MediaQuery.of(context).size.height / 32.85,
            right: MediaQuery.of(context).size.width / 75.88),
        child: Icon(
          Icons.search,
          color: Colors.black54,
          size: MediaQuery.of(context).size.width / 39.02,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 43.8),
        child: Container(
          width: MediaQuery.of(context).size.width / 911,
          height: MediaQuery.of(context).size.height / 16.43,
          color: Colors.black54,
        ),
      ),
      Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width / 54.64),
        child: PopupMenuButton<opts>(
          onSelected: (opts o) {
            print('selected item is $o');
            if (o == opts.Trips) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TripPage()));
            }
          },
          child: Text(
            '...',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 39.02,
                fontWeight: FontWeight.bold),
          ),
          itemBuilder: (BuildContext context) => <PopupMenuEntry<opts>>[
            const PopupMenuItem<opts>(
              value: opts.Trips,
              child: Text('Our Trips'),
            ),
            const PopupMenuItem<opts>(
              value: opts.AboutUs,
              child: Text('About Us'),
            ),
          ],
        ),
      )
    ],
  ).showCursorOnHover;
}
