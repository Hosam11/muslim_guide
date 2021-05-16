import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      backgroundColor: Theme.of(context).primaryColor,
      image: Image.asset('assets/images/logo.png'),
      title: Text(appTitle),
      photoSize: 50.0,
      loaderColor: Colors.white,
      navigateAfterSeconds: HomeScreen(),
    );
  }
}
