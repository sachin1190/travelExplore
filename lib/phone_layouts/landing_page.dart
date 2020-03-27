import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:travel_ui/trips.dart';

class MobileLayout extends StatefulWidget {
  String heading1;
  String heading2;
  String dir1;
  String dir11;
  String dir2;
  String dir22;
  String backImg;
  String anim;
  PageController pc;
  Color textCol;
  double routeOpa;
  int nextPage;
  Color btnCol;
  int prevPage;
  String pageNo;
  MobileLayout(
      {this.heading1,
      this.heading2,
      this.pageNo,
      this.dir1,
      this.nextPage,
      this.prevPage,
      this.dir11,
      this.routeOpa,
      this.pc,
      this.textCol,
      this.btnCol,
      this.dir2,
      this.dir22,
      this.backImg,
      this.anim});

  @override
  _MobileLayoutState createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout>
    with TickerProviderStateMixin {
  TabController cont;
  AnimationController controller;
  Animation<double> animation;

  Animation scaleAnim;
  AnimationController scaleAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cont = new TabController(length: 4, vsync: this);

    controller = AnimationController(
        duration: const Duration(milliseconds: 9000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        widget.pc.animateToPage(widget.nextPage,
            duration: Duration(milliseconds: 50), curve: Curves.easeIn);
    });

    scaleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 9000), vsync: this);
    scaleAnim =
        Tween<double>(begin: 1, end: 1.1).animate(scaleAnimationController);

    scaleAnimationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cont.dispose();
    controller.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: scaleAnim,
          builder: (context, child) {
            return Transform.scale(
              scale: scaleAnim.value,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.backImg), fit: BoxFit.cover),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 7.75,
              left: MediaQuery.of(context).size.width / 10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 6.25),
                        child: Text(
                          widget.heading1,
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              color: widget.textCol,
                              fontSize: MediaQuery.of(context).size.width / 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Text(
                          '${widget.heading2}      ',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              color: widget.textCol,
                              fontSize:
                                  MediaQuery.of(context).size.width / 10.41,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 12.4,
                            left: MediaQuery.of(context).size.width / 12.5),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 5,
                          height: MediaQuery.of(context).size.height / 15.5,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TripPage(),
                                ),
                              );
                            },
                            child: Text(
                              'EXPLORE',
                              style: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 41.66,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: widget.btnCol,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 8.33,
                    top: MediaQuery.of(context).size.height / 12.3333),
                child: Container(
                  width: MediaQuery.of(context).size.height / 2.5,
                  height: MediaQuery.of(context).size.height / 12.4,
                  child: TabBar(
                      controller: cont,
                      indicatorColor: widget.textCol,
                      labelColor: widget.textCol,
                      tabs: [
                        Tab(
                          icon: Icon(
                            Icons.local_taxi,
                            size: MediaQuery.of(context).size.height / 30,
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.local_taxi,
                            size: MediaQuery.of(context).size.height / 30,
                          ),
                        ),
                        Tab(
                          // iconMargin: EdgeInsets.only(right: 55),
                          icon: Icon(
                            Icons.directions_boat,
                            size: MediaQuery.of(context).size.height / 30,
                          ),
                        ),
                        Tab(
                          // iconMargin: EdgeInsets.only(right: 55),
                          icon: Icon(
                            Icons.directions_boat,
                            size: MediaQuery.of(context).size.height / 30,
                          ),
                        ),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 12.5),
                child: Container(
                  width: MediaQuery.of(context).size.height / 2.5,
                  height: MediaQuery.of(context).size.height / 20.66,
                  child: TabBarView(controller: cont, children: [
                    Row(
                      children: <Widget>[
                        Text(
                          '3h 21min(2222Km)   ',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize:
                                  MediaQuery.of(context).size.height / 35.77,
                              color: widget.textCol),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: MediaQuery.of(context).size.width / 27.77,
                          color: widget.textCol,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '3h 21min(2222Km)   ',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize:
                                  MediaQuery.of(context).size.height / 35.77,
                              color: widget.textCol),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: MediaQuery.of(context).size.width / 27.77,
                          color: widget.textCol,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '3h 21min(2222Km)   ',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize:
                                  MediaQuery.of(context).size.height / 35.77,
                              color: widget.textCol),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: MediaQuery.of(context).size.width / 27.77,
                          color: widget.textCol,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '3h 21min(2222Km)   ',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              fontSize:
                                  MediaQuery.of(context).size.height / 35.77,
                              color: widget.textCol),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: MediaQuery.of(context).size.width / 27.77,
                          color: widget.textCol,
                        )
                      ],
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4.76),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 50),
                      child: GestureDetector(
                        onTap: () {
                          widget.pc.animateToPage(widget.prevPage,
                              duration: Duration(milliseconds: 50),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 14.28,
                            height: MediaQuery.of(context).size.height / 17.71,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 15,
                            )),
                      ),
                    ),
                    Container(
                      height: 3,
                      width: MediaQuery.of(context).size.width / 1.7075,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white30,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                        value: animation.value,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 50),
                      child: GestureDetector(
                        onTap: () {
                          widget.pc.animateToPage(widget.nextPage,
                              duration: Duration(milliseconds: 50),
                              curve: Curves.easeIn);
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width / 14.28,
                            height: MediaQuery.of(context).size.height / 17.71,
                            decoration: BoxDecoration(
                                boxShadow: [],
                                shape: BoxShape.circle,
                                color: Colors.white),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
