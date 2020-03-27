import 'package:flutter/material.dart';
import 'extensions/hoverBuilder.dart';
import 'extensions/hover.dart';
import 'tripDetailsPhone.dart';
import 'cardModel.dart';
import 'tripDetailsDesktop.dart';
import 'extensions/responsiveBuilder.dart';

class TripDetailsPage extends StatefulWidget {
  @override
  _TripDetailsPageState createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
        desktop: TripDetailsDesktop(), mobile: TripDetailsPhone());
  }
}
