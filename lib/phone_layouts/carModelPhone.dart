import 'package:flutter/material.dart';
import 'package:travel_ui/extensions/hoverBuilder.dart';
import 'package:travel_ui/extensions/hover.dart';
import 'package:travel_ui/extensions/starRating.dart';
import 'package:travel_ui/tripDetailsPage.dart';

class CardModel extends StatefulWidget {
  final String img;

  CardModel({this.img});

  @override
  _CardModelState createState() => _CardModelState();
}

class _CardModelState extends State<CardModel>
    with SingleTickerProviderStateMixin {
  Animation scaleAnim;
  AnimationController scaleAnimController;
  bool hover = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scaleAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    scaleAnim = Tween<double>(begin: 1, end: 1.1).animate(scaleAnimController);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            hover = true;
          });
        },
        child: Card(
          elevation: 4,
          child: AnimatedBuilder(
            animation: scaleAnim,
            builder: (context, child) {
              return Transform.scale(
                scale: hover
                    ? {scaleAnimController.forward(), scaleAnim.value}
                        .elementAt(1)
                    : {1, resetCont()}.elementAt(0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 3.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.img), fit: BoxFit.cover),
                      ),
                    ),
                    hover
                        ? Container(color: Colors.black.withOpacity(0.5))
                        : Container(),
                    hover
                        ? Padding(
                            padding: const EdgeInsets.only(top: 80.0),
                            child: Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 5.66,
                                height:
                                    MediaQuery.of(context).size.height / 16.42,
                                child: RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TripDetailsPage()));
                                  },
                                  child: Text(
                                    'VISIT',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35,
                                        color: Colors.white),
                                  ),
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    hover
                        ? Padding(
                            padding: const EdgeInsets.only(top: 130.0),
                            child: Center(
                              child: SmoothStarRating(
                                size: MediaQuery.of(context).size.width / 18.64,
                                rating: 4,
                                onRatingChanged: (c) {},
                                color: Colors.yellow,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              );
            },
          ),
        ).showCursorOnHover,
      ),
    );
  }

  int resetCont() {
    scaleAnimController.reset();
    return 0;
  }
}
