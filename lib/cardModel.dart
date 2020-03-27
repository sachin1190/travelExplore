import 'package:flutter/material.dart';
import 'extensions/hoverBuilder.dart';
import 'extensions/hover.dart';
import 'extensions/starRating.dart';
import 'tripDetailsPage.dart';

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
    return showButtonAsCursor(
      ScaleOnHover(builder: (context, hover) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.img), fit: BoxFit.cover),
                        ),
                      ),
                      hover
                          ? Container(color: Colors.black.withOpacity(0.5))
                          : Container(),
                      hover
                          ? Center(
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 13.66,
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
                                                92,
                                        color: Colors.white),
                                  ),
                                  color: Colors.orange,
                                ),
                              ),
                            )
                          : Container(),
                      hover
                          ? Positioned(
                              top: MediaQuery.of(context).size.width / 4.19,
                              left: MediaQuery.of(context).size.width / 9.10,
                              child: SmoothStarRating(
                                size: MediaQuery.of(context).size.width / 54.64,
                                rating: 4,
                                onRatingChanged: (c) {},
                                color: Colors.yellow,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }

  int resetCont() {
    scaleAnimController.reset();
    return 0;
  }
}
