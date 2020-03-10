import 'package:flutter/material.dart';

class ExpPage extends StatefulWidget {
  @override
  _ExpPageState createState() => _ExpPageState();
}

class _ExpPageState extends State<ExpPage> with SingleTickerProviderStateMixin {
  Animation scaleAnim;
  AnimationController scaleAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scaleAnimationController = AnimationController(
        duration: const Duration(milliseconds: 7000), vsync: this);
    scaleAnim =
        Tween<double>(begin: 1, end: 1.2).animate(scaleAnimationController);

    scaleAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AnimatedBuilder(
            animation: scaleAnim,
            builder: (context, child) {
              return Transform.scale(
                scale: scaleAnim.value,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img1.jpeg'),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
