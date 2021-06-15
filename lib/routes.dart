import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/screens/home_screen.dart';
import 'package:muslim_guide/screens/quran_page_controller.dart';
import 'package:muslim_guide/screens/surahs_list_screen.dart';
import 'package:muslim_guide/screens/quran_page_screen.dart';

const String splashScreen = 'splashScreen';
const String homeScreen = 'homeScreen';
const String quranScreen = 'quranScreen';
// const String surahScreen = 'surahScreen';
const String quranPageController = 'quranPageController';
/*

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
*/
/*  splashScreen: (BuildContext context) => MySplashScreen(),
  homeScreen: (BuildContext context) => HomeScreen(),
  quranScreen: (BuildContext context) => QuranScreen(),
  surahScreen: (context) => SurahScreen(),*/
/*

};
*/

// Type: Route<dynamic> Function(RouteSettings)
Route<dynamic> generateRoutes(RouteSettings settings) {
  Fimber.i('build route for ${settings.name}');
  switch (settings.name) {
    case homeScreen:
      return createPageBuilder(HomeScreen());

    case quranScreen:
      return createPageBuilder(SurahsListScreen());

/*
    case surahScreen:
      return createPageBuilder(QuranPageScreen());
*/

    case quranPageController:
      return createPageBuilder(QuranPageController());

    default:
      return null;
  }
}

PageRouteBuilder createPageBuilder(Widget widget) => PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
