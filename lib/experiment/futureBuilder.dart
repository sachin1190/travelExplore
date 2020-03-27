import 'package:flutter/material.dart';
import 'package:travel_ui/extensions/responsiveBuilder.dart';
import 'phonePage.dart';
import 'desktopPage.dart';

class FutureDecider extends StatefulWidget {
  @override
  _FutureDeciderState createState() => _FutureDeciderState();
}

class _FutureDeciderState extends State<FutureDecider> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: getInt(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.hasData) {
          print('data received is ${snapshot.data}');
          return ScreenTypeLayout(
            mobile: PhonePage(
              data: snapshot.data,
            ),
            desktop: DesktopPage(
              data: snapshot.data,
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

Future<int> getInt() async {
  int i = await Future.delayed(Duration(seconds: 5), () {
    return 5;
  });
  return i;
}
