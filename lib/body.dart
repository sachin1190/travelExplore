import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'navbar.dart';
import 'package:flare_flutter/flare_actor.dart';

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
            getNavbar(),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, top: 20),
                      child: Text(
                        widget.heading1,
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            color: widget.textCol,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0, top: 10),
                      child: Text(
                        '${widget.heading2}     ',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            color: widget.textCol,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, right: 120),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'EXPLORE NOW',
                          style: TextStyle(
                              fontFamily: 'JosefinSans',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        color: widget.btnCol,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, bottom: 150),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${widget.dir1}/',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: widget.textCol),
                      ),
                      Text(
                        '          ${widget.dir11}',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: widget.textCol),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Opacity(
                    opacity: widget.routeOpa,
                    child: Container(
                      width: 300,
                      height: 200,
                      color: Colors.white10.withOpacity(0),
                      child: FlareActor(
                        'assets/travel.flr',
                        animation: widget.anim,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${widget.dir2}/                     ',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: widget.textCol),
                      ),
                      Text(
                        widget.dir22,
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: widget.textCol),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 200,
                        height: 35,
                        child: TabBar(
                            controller: cont,
                            indicatorColor: widget.textCol,
                            labelColor: widget.textCol,
                            tabs: [
                              Tab(
                                icon: Icon(
                                  Icons.local_taxi,
                                  size: 20,
                                ),
                              ),
                              Tab(
                                icon: Icon(
                                  Icons.local_taxi,
                                  size: 20,
                                ),
                              ),
                              Tab(
                                // iconMargin: EdgeInsets.only(right: 55),
                                icon: Icon(
                                  Icons.directions_boat,
                                  size: 20,
                                ),
                              ),
                              Tab(
                                // iconMargin: EdgeInsets.only(right: 55),
                                icon: Icon(
                                  Icons.directions_boat,
                                  size: 20,
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        width: 200,
                        height: 35,
                        child: TabBarView(controller: cont, children: [
                          Row(
                            children: <Widget>[
                              Text(
                                '3h 21min(2222Km)   ',
                                style: TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 15,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
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
                                    fontSize: 15,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
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
                                    fontSize: 15,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
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
                                    fontSize: 15,
                                    color: widget.textCol),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                                color: widget.textCol,
                              )
                            ],
                          ),
                        ]),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80.0, top: 150),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.pageNo,
                    style: TextStyle(color: Colors.white, fontSize: 90),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45, top: 50.0),
                    child: Container(
                      height: 4,
                      width: 800,
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
                    padding: const EdgeInsets.only(top: 30.0, left: 10),
                    child: RaisedButton(
                      onPressed: () {
                        widget.pc.animateToPage(widget.prevPage,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeIn);
                      },
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black54,
                          size: 15,
                        ),
                      ),
                      shape: CircleBorder(),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: RaisedButton(
                      onPressed: () {
                        widget.pc.animateToPage(widget.nextPage,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeIn);
                      },
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 15,
                        ),
                      ),
                      shape: CircleBorder(),
                      color: Colors.white,
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
