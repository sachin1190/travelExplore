import 'package:flutter/material.dart';
import 'carModelPhone.dart';
import 'drawer.dart';

class TripPagePhone extends StatefulWidget {
  @override
  _TripPagePhoneState createState() => _TripPagePhoneState();
}

class _TripPagePhoneState extends State<TripPagePhone> {
  List<CardModel> cards = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPhone(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            backgroundColor: Colors.orange.shade400,
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/glowing.jpg',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(bottom: 15, left: 40),
              title: Text('PLAN YOUR NEXT TRIP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 21.33,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'JosefinSans')),
            ),
          ),
//          SliverPersistentHeader(
//              pinned: true,
//              floating: true,
//              delegate: NetworkingPageHeader(
//                  maxExtent: MediaQuery.of(context).size.height / 3,
//                  minExtent: 100)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return cards.elementAt(index);
              },
              childCount: 11,
            ),
          ),
        ],
      ),
    );
  }
}
