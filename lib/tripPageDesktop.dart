import 'package:flutter/material.dart';
import 'extensions/hoverBuilder.dart';
import 'extensions/hover.dart';
import 'cardModel.dart';
import 'extensions/headerDelegate.dart';
import 'extensions/responsiveBuilder.dart';
import 'phone_layouts/phone_trip.dart';

class TripPageDesktop extends StatefulWidget {
  @override
  _TripPageDesktopState createState() => _TripPageDesktopState();
}

class _TripPageDesktopState extends State<TripPageDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: NetworkingPageHeader(maxExtent: 300, minExtent: 100)),
          SliverGrid.count(
            //shrinkWrap: true,
            crossAxisCount: 3,
            children: <Widget>[
              CardModel(img: 'assets/maldives.jpg'),
              CardModel(img: 'assets/antartica.jpeg'),
              CardModel(img: 'assets/img1.jpeg'),
              CardModel(img: 'assets/img2.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
              CardModel(img: 'assets/img3.jpeg'),
            ],
          ),
        ],
      ),
    );
  }
}
