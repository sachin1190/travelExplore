import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NetworkingPageHeader implements SliverPersistentHeaderDelegate {
  NetworkingPageHeader({
    this.minExtent,
    @required this.maxExtent,
  });

  final double minExtent;

  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('PLAN YOUR NEXT TRIP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 21.33,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JosefinSans')),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/glowing.jpg'), fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class TripDetailsAppBar implements SliverPersistentHeaderDelegate {
  TripDetailsAppBar({
    this.minExtent,
    this.txt,
    this.color,
    @required this.maxExtent,
  });
  final Color color;
  final double minExtent;
  final String txt;
  final double maxExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: color,
          child: Text(
            txt,
            style: TextStyle(fontFamily: 'JosefinSans'),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}
/*
SliverAppBar(
    automaticallyImplyLeading: false,
    backgroundColor: color,
    pinned: true,
    floating: false,
    expandedHeight: MediaQuery.of(context).size.width / 13.66,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(bottom: 15, left: 40),
      title: Text(
        txt,
        style: TextStyle(fontFamily: 'JosefinSans'),
      ),
    ),
  );
 */
