import 'package:flutter/material.dart';
import 'package:travel_ui/tripPageDesktop.dart';
import 'extensions/responsiveBuilder.dart';
import 'phone_layouts/phone_trip.dart';
import 'models/tripModel.dart';
import 'package:http/http.dart' as http;

//class TripPage extends StatefulWidget {
//  @override
//  _TripPageState createState() => _TripPageState();
//}
//
//class _TripPageState extends State<TripPage> {
//  @override
//  Widget build(BuildContext context) {
//    return ScreenTypeLayout(
//        desktop: TripPageDesktop(), mobile: TripPagePhone());
//  }
//}
Future<List<Trip>> getAllTrips() async {
  print('function called');
  String baseUrl = 'http://127.0.0.1:8000/';
  String url = baseUrl + 'trips/';
  http.Response res = await http.get(url);
  print('res status code is ${res.statusCode}');
  print('res body code is ${res.body}');
  return allTripsFromJson(res.body);
}

//Future<List<Trip>> getAllTrips() async {
//  print('function called');
//  String url = 'http://127.0.0.1:8000/trips/';
//  var dio = Dio();
//  Response res = await dio.get(url);
//  print('res status code is ${res.statusCode}');
//  print('res body code is ${res.data}');
//  return allTripsFromJson(res.data);
//}

class TripPage extends StatefulWidget {
  @override
  _TripPageState createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  Future<List<Trip>> trips;

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    trips = getAllTrips();
//  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Trip>>(
      future: getAllTrips(),
      builder: (BuildContext context, AsyncSnapshot<List<Trip>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          print('data received is ${snapshot.data.length}');
          return ScreenTypeLayout(
            mobile: TripPageDesktop(),
            desktop: TripPagePhone(),
          );
        } else if (snapshot.connectionState == ConnectionState.active) {
          return Center(child: CircularProgressIndicator());
        } else
          return Center(
              child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ));
      },
    );
  }
}
