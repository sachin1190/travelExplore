import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:travel_ui/navbar.dart';
import 'body.dart';
import 'exppage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  PageController pageCont = new PageController(keepPage: false);
  String nextAnim;
  int currPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // print(pageCont.position);

    pageCont.addListener(() {
      if (pageCont.page == 0) {
        setState(() {
          nextAnim = null;
        });
      }
      if (pageCont.page == 1) {
        setState(() {
          nextAnim = 'chiToAus';
        });
      }
      if (pageCont.page == 2) {
        setState(() {
          nextAnim = 'anim2';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageCont,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Page1(
            heading1: 'STUNNING',
            heading2: 'FEILDS',
            dir1: 'Hangzhou',
            pc: pageCont,
            nextPage: 1,
            prevPage: null,
            textCol: Colors.black54,
            btnCol: Colors.redAccent,
            dir11: 'Hangzou/China',
            dir2: 'Bejing',
            routeOpa: 0.6,
            pageNo: '01',
            dir22: 'Bejing Airport/China',
            backImg: 'assets/img1.jpeg',
            anim: null,
          ),
          Page1(
            heading1: 'STUNNING',
            heading2: 'VEIWS ',
            textCol: Colors.white,
            btnCol: Colors.teal.shade200,
            pc: pageCont,
            nextPage: 2,
            pageNo: '02',
            prevPage: 0,
            dir1: 'Nuuk',
            routeOpa: 1,
            dir11: 'Nuuk/Greenland',
            dir2: 'Nuuk',
            dir22: 'Nuuk Airport/Greenland',
            backImg: 'assets/newimg.jpg',
            anim: nextAnim,
          ),
          Page1(
            heading1: 'STUNNING',
            heading2: 'HILLS   ',
            textCol: Colors.black87,
            btnCol: Colors.redAccent,
            pc: pageCont,
            nextPage: 0,
            pageNo: '03',
            prevPage: 1,
            dir1: 'Cappadocia',
            routeOpa: 0.8,
            dir11: 'Cappadocia/Turkey',
            dir2: 'Cappadocia',
            dir22: 'Saint Martin/Turkey',
            backImg: 'assets/cappadocia.jpeg',
            anim: nextAnim,
          ),
        ],
      ),
    );
  }
}
