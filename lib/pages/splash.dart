import 'package:flutter/material.dart';
import 'package:mnews/navigator.dart';
import 'package:mnews/pages/home.dart';
import 'package:mnews/style/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _controller.forward();
    _controller.addListener(() {
      if(_controller.status ==AnimationStatus.completed){
        pushPage(context, MyHomePage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
              transform: Matrix4.identity()
                ..translate(0.0, -400.0 * (1 - animation.value)),
              child: child);
        },
        child: Image.asset(
          'assets/images/news.png',
          width: 200,
          color: accentColor,
        ),
      ))),
    );
  }
}
