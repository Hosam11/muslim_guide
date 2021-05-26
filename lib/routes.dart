import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/screens/home_screen.dart';
import 'package:muslim_guide/screens/quran_screen.dart';
import 'package:muslim_guide/screens/surah_screen.dart';

const String splashScreen = 'splash_screen';
const String homeScreen = 'home_screen';
const String quranScreen = 'quran_screen';
const String surahScreen = 'surah_screen';
/*

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
*/
/*  splashScreen: (BuildContext context) => MySplashScreen(),
  homeScreen: (BuildContext context) => HomeScreen(),
  quranScreen: (BuildContext context) => QuranScreen(),
  surahScreen: (context) => SurahScreen(),*/ /*

};
*/

// Type: Route<dynamic> Function(RouteSettings)
Route<dynamic> generateRoutes(RouteSettings settings) {
  Fimber.i('build route for ${settings.name}');
  switch (settings.name) {
    case homeScreen:
      return createPageBuilder(HomeScreen());

    case quranScreen:
      return createPageBuilder(QuranScreen());

    case surahScreen:
      return createPageBuilder(SurahScreen());

    default:
      return null;
  }
}

PageRouteBuilder createPageBuilder(Widget widget) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
