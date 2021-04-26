import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_starter/core/app_gradients.dart';
import 'package:flutter_starter/core/app_images.dart';

class SplashPage02 extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage02> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
