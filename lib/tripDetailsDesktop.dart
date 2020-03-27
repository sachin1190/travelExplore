import 'package:flutter/material.dart';
import 'extensions/starRating.dart';
import 'extensions/responsiveBuilder.dart';
import 'phone_layouts/drawer.dart';
import 'package:travel_ui/extensions/headerDelegate.dart';

class TripDetailsDesktop extends StatefulWidget {
  @override
  _TripDetailsDesktopState createState() => _TripDetailsDesktopState();
}

class _TripDetailsDesktopState extends State<TripDetailsDesktop> {
  PageController contt = new PageController(initialPage: 0);
  int currPage = 0;

  PageController dayContt = new PageController(initialPage: 0);
  int dayCurrPage = 0;

  ScrollController scContt = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    contt.addListener(() {
      setState(() {
        currPage = contt.page.ceil();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scContt,
        slivers: <Widget>[
          getTopAppBar('Trip Details', Colors.orange.shade500, context),
          getListImages(context, contt, currPage),
          getIncludedAppBarDesktop(context),
          getTripDetailsList(context),
          getTopAppBar('Day 1', Colors.orange.shade400, context),
          getDayImageList(),
          getStepper(),
          getTopAppBar('Day 2', Colors.orange.shade300, context),
          getDayImageList(),
          getStepper(),
          getTopAppBar('Day 3', Colors.orange.shade200, context),
          getDayImageList(),
          getStepper(),
          getTopAppBar('About Us', Colors.yellow, context),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                height: MediaQuery.of(context).size.height / 1.19,
              )
            ]),
          ),
        ],
      ),
    );
  }
}

Widget getStepper() {
  return SliverToBoxAdapter(
    child: Stepper(
        currentStep: 0,
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return Row(
            children: <Widget>[
              Container(
                child: null,
              ),
              Container(
                child: null,
              ),
            ],
          );
        },
        steps: [
          Step(
              title: Text('Go to Place A'),
              content: Container(
                height: 50,
              ),
              isActive: true),
          Step(
              title: Text('Go to Place A'),
              content: Container(
                height: 50,
              ),
              isActive: true),
          Step(
              title: Text('Go to Place A'),
              content: Container(
                height: 50,
              ),
              isActive: true),
        ]),
  );
}

Widget getDayImageList() {
  return SliverToBoxAdapter(
    child: Container(
      height: 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, bottom: 15),
            child: Card(
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img1.jpeg'),
                        fit: BoxFit.cover)),
                width: 300,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, bottom: 15),
            child: Card(
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img2.jpeg'),
                        fit: BoxFit.cover)),
                width: 300,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, bottom: 15),
            child: Card(
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img3.jpeg'),
                        fit: BoxFit.cover)),
                width: 300,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, bottom: 15),
            child: Card(
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/newimg.jpg'),
                        fit: BoxFit.cover)),
                width: 300,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, bottom: 15),
            child: Card(
              elevation: 6,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/maldives.jpg'),
                        fit: BoxFit.cover)),
                width: 300,
                height: 200,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getTopAppBar(String txt, Color color, BuildContext context) {
  return SliverAppBar(
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
}

Widget getTripDetailsList(BuildContext context) {
  return SliverList(
      delegate: SliverChildListDelegate([
    Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 32.8),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.38,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 34.15),
              child: Column(
                children: <Widget>[
                  Text('Gateway to heaven',
                      style: TextStyle(
                        fontFamily: 'JosefinSans',
                        fontSize: MediaQuery.of(context).size.height / 26.28,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text('3D 4N Trip to China     ',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: MediaQuery.of(context).size.height / 32.65,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('2 Persons                        ',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: MediaQuery.of(context).size.height / 36.5,
                        )),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        bottom: 10,
                        top: 10,
                        left: MediaQuery.of(context).size.width / 23),
                    child: Text('3.8k+ Ratings',
                        style: TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: MediaQuery.of(context).size.height / 40.85,
                        ))),
                Padding(
                  //80
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 26.70),
                  child: SmoothStarRating(
                    rating: 4,
                    onRatingChanged: (r) {},
                    size: MediaQuery.of(context).size.height / 28.9,
                    color: Colors.yellow,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  ]));
}

Widget getIncludedAppBarPhone(BuildContext context) {
  return SliverAppBar(
    pinned: true,
    floating: false,
    automaticallyImplyLeading: false,
    expandedHeight: MediaQuery.of(context).size.width / 15.07,
    backgroundColor: Colors.white,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 43.8,
          left: MediaQuery.of(context).size.width / 34.15,
          top: MediaQuery.of(context).size.height / 65.7),
      collapseMode: CollapseMode.parallax,
      title: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              'Included Items',
              style: TextStyle(color: Colors.black, fontFamily: 'JosefinSans'),
            ),
          ),
          getChips(context),
          getChips(context),
          getChips(context),
          getChips(context)
        ],
      ),
    ),
  );
}

Widget getIncludedAppBarDesktop(BuildContext context) {
  return SliverAppBar(
    pinned: true,
    floating: false,
    expandedHeight: MediaQuery.of(context).size.width / 15.07,
    backgroundColor: Colors.white,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height / 43.8,
          left: MediaQuery.of(context).size.width / 34.15,
          top: MediaQuery.of(context).size.height / 65.7),
      collapseMode: CollapseMode.parallax,
      title: Row(
        children: <Widget>[
          Text(
            'Included Items',
            style: TextStyle(color: Colors.black, fontFamily: 'JosefinSans'),
          ),
          getChips(context),
          getChips(context),
          getChips(context),
          getChips(context)
        ],
      ),
    ),
  );
}

Widget getChips(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 68.3),
    child: Container(
      height: 30,
      child: InputChip(
        backgroundColor: Colors.grey.shade300,
        avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade800,
            child: Icon(
              Icons.airplanemode_active,
              size: MediaQuery.of(context).size.height / 50.75,
              color: Colors.white,
            )),
        label: Text(
          'Flights',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 50.75,
              fontFamily: 'JosefinSans'),
        ),
      ),
    ),
  );
}

Widget getListImages(BuildContext context, PageController contt, int currPage) {
  return SliverToBoxAdapter(
    child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.6425,
          child: ListView(
            controller: contt,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Image.asset(
                'assets/visit2.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.55,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/visit1.jpg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 4.55,
              ),
              Image.asset(
                'assets/visit3.jpg',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 4.55,
              ),
            ],
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 150, left: 20),
            child: GestureDetector(
              onTap: () {
                contt.animateToPage(currPage - 1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Container(
                  width: 70,
                  height: 50,
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
        ),
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(
                top: 150, left: MediaQuery.of(context).size.width - 80),
            child: GestureDetector(
              onTap: () {
                contt.animateToPage(currPage + 1,
                    duration: Duration(milliseconds: 100),
                    curve: Curves.bounceIn);
              },
              child: Container(
                  width: 70,
                  height: 50,
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
        )
      ],
    ),
  );
}
