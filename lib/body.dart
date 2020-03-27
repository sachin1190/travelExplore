import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navbar.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'extensions/hover.dart';
import 'trips.dart';

class Page1 extends StatefulWidget {
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
  Page1(
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
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin {
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
        Column(
          children: <Widget>[
            getNavbar(context),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 17,
                          top: MediaQuery.of(context).size.height / 32.5),
                      child: Text(
                        widget.heading1,
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            color: widget.textCol,
                            fontSize: MediaQuery.of(context).size.width / 16.4,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 17,
                          top: MediaQuery.of(context).size.height / 65.7),
                      child: Text(
                        '${widget.heading2}     ',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            color: widget.textCol,
                            fontSize: MediaQuery.of(context).size.width / 16.8,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 68,
                          right: MediaQuery.of(context).size.width / 7.41),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 8.035,
                        height: MediaQuery.of(context).size.height / 16.42,
                        child: showButtonAsCursor(
                          RaisedButton(
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
                                      MediaQuery.of(context).size.width / 80,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: widget.btnCol,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 54,
                      bottom: MediaQuery.of(context).size.height / 5.10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${widget.dir1}/',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: MediaQuery.of(context).size.width / 60,
                            color: widget.textCol),
                      ),
                      Text(
                        '       ${widget.dir11}',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: MediaQuery.of(context).size.width / 60,
                            color: widget.textCol),
                      ),
                    ],
                  ),
                ),
                Opacity(
                  opacity: widget.routeOpa,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 6.19,
                    height: MediaQuery.of(context).size.height / 1.83,
                    color: Colors.white10.withOpacity(0),
                    child: FlareActor(
                      'assets/travel.flr',
                      animation: widget.anim,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 7.10,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${widget.dir2}/                    ',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: MediaQuery.of(context).size.width / 60,
                            color: widget.textCol),
                      ),
                      Text(
                        widget.dir22,
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: MediaQuery.of(context).size.width / 60,
                            color: widget.textCol),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 6.6),
                      Container(
                        width: MediaQuery.of(context).size.width / 4.83,
                        height: MediaQuery.of(context).size.width / 39.02,
                        child: TabBar(
                            controller: cont,
                            indicatorColor: widget.textCol,
                            labelColor: widget.textCol,
                            tabs: [
                              Tab(
                                icon: Icon(
                                  Icons.local_taxi,
                                  size:
                                      MediaQuery.of(context).size.width / 68.3,
                                ),
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.local_taxi,
                                  size:
                                      MediaQuery.of(context).size.width / 68.3,
                                ),
                              ),
                              Tab(
                                // iconMargin: EdgeInsets.only(right: 55),
                                icon: Icon(
                                  Icons.directions_boat,
                                  size:
                                      MediaQuery.of(context).size.width / 68.3,
                                ),
                              ),
                              Tab(
                                // iconMargin: EdgeInsets.only(right: 55),
                                icon: Icon(
                                  Icons.directions_boat,
                                  size:
                                      MediaQuery.of(context).size.width / 68.3,
                                ),
                              ),
                            ]),
                      ).showCursorOnHover,
                      Container(
                        width: MediaQuery.of(context).size.width / 6.83,
                        height: MediaQuery.of(context).size.height / 18.77,
                        child: TabBarView(controller: cont, children: [
                          Row(
                            children: <Widget>[
                              Text(
                                '3h 21min(2222Km)   ',
                                style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            91.06,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: MediaQuery.of(context).size.width / 91.06,
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
                                        MediaQuery.of(context).size.width /
                                            91.06,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: MediaQuery.of(context).size.width / 91.06,
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
                                        MediaQuery.of(context).size.width /
                                            91.06,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: MediaQuery.of(context).size.width / 91.06,
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
                                        MediaQuery.of(context).size.width /
                                            91.06,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: MediaQuery.of(context).size.width / 91.06,
                                color: widget.textCol,
                              )
                            ],
                          ),
                        ]),
                      ).showCursorOnHover,
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 17,
                  top: MediaQuery.of(context).size.height / 6.56),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.pageNo,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width / 15.17),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 30.55,
                        top: MediaQuery.of(context).size.height / 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 164,
                      width: MediaQuery.of(context).size.width / 1.7075,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white30,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                        value: animation.value,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 22.9,
                        left: MediaQuery.of(context).size.width / 136.6),
                    child: GestureDetector(
                      onTap: () {
                        widget.pc.animateToPage(widget.prevPage,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 34.15,
                          height: MediaQuery.of(context).size.height / 16.42,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(2, -2),
                                spreadRadius: -3,
                                blurRadius: 10),
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(-2, 2),
                                spreadRadius: -3,
                                blurRadius: 10)
                          ], shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40,
                        top: MediaQuery.of(context).size.height / 22.9),
                    child: GestureDetector(
                      onTap: () {
                        widget.pc.animateToPage(widget.nextPage,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeIn);
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width / 34.15,
                          height: MediaQuery.of(context).size.height / 16.42,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black45,
                                offset: Offset(2, -2),
                                spreadRadius: -3,
                                blurRadius: 10),
                            BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(-2, 2),
                                spreadRadius: -3,
                                blurRadius: 10)
                          ], shape: BoxShape.circle, color: Colors.white),
                          child: Icon(Icons.arrow_forward_ios)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
